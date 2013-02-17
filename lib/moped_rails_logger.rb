require "moped_rails_logger/version"
require 'moped_rails_logger/log_subscriber'
require 'moped_rails_logger/railtie' if defined?(Rails)
require 'moped_rails_logger/rack_rails_logger' if defined?(RackRailsLogger)

module MopedRailsLogger
end

require 'moped/node'
require 'active_support/notifications'

module Moped
  class Node
    def logging(operations)
      raw_payload = {
        operations: operations,
        resolved_address: resolved_address,
      }

      ::ActiveSupport::Notifications.instrument('logging.moped', raw_payload) do
        yield
      end
    end
  end
end
