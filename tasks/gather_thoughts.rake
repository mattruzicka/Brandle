task :gather_input => :environment do 
  puts "What would like to talk about?"
end

task :gather_thoughts => :environment do
  while sleep 5
    concepts = Concept.ungathered
    if concepts.present?
      concepts.each do |concept|
        query_twitter(concept.links)
        concept.gathered = true
        concept.save
      end
   #   load_dictionary
    end
  end
end

# -http not working 
def query_twitter(links)
  links.each do |link|
    thoughts = []
    Twitter.search(%Q{"#{link}" -rt -http}, :count => 100, :result_type => "recent").results.map do |status|
      thoughts << status.full_text
    end
    thoughts.uniq!
    augment_dictionary(thoughts)
  end
end

def augment_dictionary(thoughts)
  File.open('config/dictionary.txt', 'a') do |f|
    thoughts.each { |t| f.puts(t) }
  end
end

def load_dictionary
  dictionary = File.read('config/dictionary.txt')
  GABBLER.learn(dictionary)
end

# should probably separate into module

def chatter(text)
  letters = text.split("")
  letters.each do |letter|
    print letter
    $stdout.flush
    sleep 0.07
    stutter? # would be cool to pass in some letters, type in wrong letters, then go back and type the right ones. 
  end
  pause_chatter
end

def pause_chatter
  if (1..3).to_a.sample == 3
    print " "
    sleep (0..2).to_a.sample
  else
    sleep (0..8).to_a.sample
    puts " "
    sleep (0..8).to_a.sample 
    puts " "
    sleep 0.5
  end
end

def stutter?
  case (1..300).to_a.sample
  when 20 then sleep 0.02
  when 40 then sleep 0.04
  when 60 then sleep 0.06
  when 80 then sleep 0.08
  when 90 then sleep 0.09
  when 110 then sleep 1.1
  when 130 then sleep 1.2
  end
end
