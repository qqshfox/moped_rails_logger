require 'rack_rails_logger/middleware'
require 'moped_rails_logger/railties/controller_runtime'

RackRailsLogger::Middleware.class_eval do
  include MopedRailsLogger::Railties::ControllerRuntime
end
