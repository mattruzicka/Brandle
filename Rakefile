task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  include Write
end

Dir.glob('tasks/*.rake').each { |r| import r }

# TRY PASSING PARAMATER (3) INTO GABBLER
task :think => :environment do 
  puts "\n\n"
  print '    o_o '.green
  while sleep (1..30).to_a.sample
    thoughts = ""
    (1..8).to_a.sample.times do
      thought = $gabbler.sentence
      if thought.length > 15 && thought.length <= 400
        thoughts << thought + " "
      end
    end
    thoughts.write
    brandle_learn
  end
end
 

def brandle_learn
  $gabbler.unlearn!
  dictionary = File.read('lib/dictionary.txt')
  $gabbler.learn(dictionary)
end