$: << File.dirname(__FILE__)

require 'farewell'

configure :development do
  class Reloader < ::Rack::Reloader
    def safe_load(file, mtime, stderr)

      if File.expand_path(file) == File.expand_path(::Sinatra::Application.app_file)
        ::Sinatra::Application.reset!
        stderr.puts "#{self.class}: reseting routes"
      end
      super
    end
  end

  use Reloader
end

run ::Sinatra::Application
