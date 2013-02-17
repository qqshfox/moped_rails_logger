require 'active_support/log_subscriber'

module MopedRailsLogger
  class LogSubscriber < ActiveSupport::LogSubscriber
    def self.runtime
      @runtime ||= 0
    end

    def self.runtime=(runtime)
      @runtime = runtime
    end

    def self.reset_runtime
      rt, self.runtime = runtime, 0
      rt
    end

    def initialize
      super
      @odd_or_even = false
    end

    def logging(event)
      self.class.runtime += event.duration
      return unless logger.debug?

      ops = event.payload[:operations]
      duration_ms = event.duration
      resolved_address = event.payload[:resolved_address]

      log_operations ops, duration_ms, resolved_address
    end

    private
    def odd?
      @odd_or_even = !@odd_or_even
    end

    def log_operations(ops, duration_ms, resolved_address)
      prefix  = "  MOPED: #{resolved_address} "
      indent  = " "*prefix.length
      runtime = (" (%.4fms)" % duration_ms)

      if ops.length == 1
        debug prefix + ops.first.log_inspect + runtime
      else
        first, *middle, last = ops

        debug prefix + first.log_inspect
        middle.each { |m| debug indent + m.log_inspect }
        debug indent + last.log_inspect + runtime
      end
    end
  end
end

MopedRailsLogger::LogSubscriber.attach_to 'moped'
