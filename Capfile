# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/npm'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
