require './initializer'
require './concept'

include Write

while true
  name = gets.chomp
  unless name.nil? || name.empty? || name =~ /^\s+$/
    concept = Concept.new(name)
    if concept.links.nil?
      puts "Sorry, I don't know much about #{concept.name}"
      puts " "
      puts " "
    else
      # print concept.links
      # puts ""
      puts concept.entry.write
    end
  end
end


