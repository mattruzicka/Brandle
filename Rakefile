task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  include Write
end

Dir.glob('tasks/*.rake').each { |r| import r }

task :think => :environment do 
  puts "\n\n"
  print "        o_o\n".green
  brandle_learn
  while sleep (1..40).to_a.sample
    thoughts = ""
    (1..8).to_a.sample.times do
      thought = @gabbler.sentence
      if thought.length > 15 && thought.length <= 400
        thoughts << thought + " "
      end
    end
    thoughts.write
  end
end
 
def brandle_learn
  @gabbler = Gabbler.new(depth: [2, 2, 3, 2].sample )
  dictionary = File.read('lib/dictionary.txt')
  @gabbler.learn(dictionary)
end