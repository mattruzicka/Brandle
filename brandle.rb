require './initializer'
require './concept'
include Write

while sleep 1
  print "What would you like to talk about? "
  name = gets.chomp
  unless name.nil? || name.empty? || name =~ /^\s+$/
    concept = Concept.new(name)
    puts concept.name.write
    if concept.links == nil
      puts "Sorry, I don't know much about #{concept.name}"
    else
      puts concept.links
    end
  end
  puts concept.links
end


