require './initializer'
require './concept'
include Write

puts "\n\n"

while true
  print '    o_o '.green
  name = gets.chomp
  unless name.nil? || name.empty? || name =~ /^\s+$/
    begin 
      concept = Concept.new(name) 
    rescue
      tab
      print "That one hurt my brain...".black
      print " o_O".green
      puts "\n\n"
      next
    end 
    
    if concept.links.nil?
      tab
      print "Sorry, I don't know much about #{concept.name}".black
      print " :&".green
      puts "\n\n"
    else
      puts concept.entry.write
      # puts "Concepts"
      # print $redis.smembers("concepts")
      # puts "\n#{concept.name} links"
      # print $redis.smembers("concept:#{concept.name} \n\n")
    end
  end
end
