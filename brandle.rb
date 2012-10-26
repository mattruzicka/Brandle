require './initializer'
require './concept'

include Write

while true
  name = gets.chomp
  unless name.nil? || name.empty? || name =~ /^\s+$/
    begin 
      concept = Concept.new(name) 
    rescue
      puts "That one hurt my brain..." 
      puts "\n\n"
      next
    end 
    
    if concept.links.nil?
      puts "Sorry, I don't know much about #{concept.name}"
      puts "\n\n"
    else
      puts concept.entry.write
    end
  end
end


 #   name.length.times { |i| $stdout.write "\n\r\r"; sleep 1}