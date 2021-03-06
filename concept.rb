class Concept
  attr_accessor :name, :links, :entry
  
  def initialize(name)
    @name = name.gsub!(/[?.!,;]?$/, '')
    @links = build_links(@name)
    @entry = ""
    $redis.sadd("concepts", @name)
    unless @links.nil? || @links.empty?
      collect_thoughts(@links)
      $redis.sadd("concepts:#{@name}", @links)
    end
  end
 
  private
  
  def build_links(concept)
    wiki = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/Special:Search/#{concept.gsub(/\s+/, '_')}"))
    links = []
    wiki.css('#mw-content-text > p a').each do |link|
      links << link.content unless unwanted(link)
    end
    links = links[0..2] << links[3..-1].sample unless links[3..-1].nil?
  end
  
  def collect_thoughts(links)
    links.each do |link|
      thoughts = []
      Twitter.search(%Q{"#{link}" -rt -http}, :count => 100, :result_type => "recent").results.map do |status|
        unless status.full_text.nil?
          status = sanitize(status.full_text)
          thoughts << status
        end
      end
      thoughts.uniq!
      unless thoughts.empty?
        @entry << thoughts.sample.to_s + " "
        augment_dictionary(thoughts)
      end
    end
  end
  
  def sanitize(status)
    words = status.split
    
    while !words.first.nil? && words.first.match(/@\w+/)
      words.delete_at(0)
    end
  
    while !words.last.nil? && words.last.match(/@\w+/)
      words.delete_at(-1)
    end
    
    words.each do |word|
      word.delete!('@') if word.match(/@\w+/)
      word.delete!('#') if word.match(/#\w+/)
      word.gsub!(/http\S+/, "")
    end
    
    status = words.join(" ")
    status = $coder.decode(status)
    status.strip!
    status
  end
  
  def augment_dictionary(thoughts)
    File.open('lib/dictionary.txt', 'a') do |f|
      thoughts.each { |t| f.puts(t) }
    end
  end
  
  def unwanted(link)
    return true if link.content.match(/\[/)
    return true if link.content.split.count > 2
    return true if link.content == ""
    return true if link.content == "next 20"
    return true if link.content == "20"
    return true if link.content == "50"
    return true if link.content == "100"
    if !link[:title].nil?
      return true if link[:title].match(/Help:IPA/i)
      return true if link[:title].match(/pronunciation/i)
      return true if link[:title].match(/listen/i)
      return true if link[:title].match(/file/i)
      return true if link[:title].match(/geographic coordinate/i)
      return true if link[:title].match(/wikipedia/i)
    end
    if !link[:class].nil?
      return true if link[:class].match(/external text/i)
      return true if link[:class].match(/internal/i)
    end
  end
  
end