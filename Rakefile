task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require './brandle'
end

Dir.glob('tasks/*.rake').each { |r| import r }