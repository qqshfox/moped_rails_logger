require 'rails/railtie'
require 'active_support/lazy_load_hooks'

module MopedRailsLogger
  class Railtie < Rails::Railtie
    initializer "moped.log_runtime" do |app|
      ActiveSupport.on_load(:action_controller) do
        require 'moped_rails_logger/railties/controller_runtime'
        include MopedRailsLogger::Railties::ControllerRuntime
      end
    end
  end
end
