require 'active_support/concern'
require 'active_support/core_ext/module/attr_internal'

module MopedRailsLogger
  module Railties
    module ControllerRuntime
      extend ActiveSupport::Concern

      protected

      attr_internal :moped_runtime

      def process_action(action, *args)
        # We also need to reset the runtime before each action
        # because of queries in moped or in cases we are streaming
        # and it won't be cleaned up by the method below.
        MopedRailsLogger::LogSubscriber.reset_runtime
        super
      end

      def cleanup_view_runtime
        moped_rt_before_render = MopedRailsLogger::LogSubscriber.reset_runtime
        runtime = super
        moped_rt_after_render = MopedRailsLogger::LogSubscriber.reset_runtime
        self.moped_runtime = moped_rt_before_render + moped_rt_after_render
        runtime - moped_rt_after_render
      end

      def append_info_to_payload(payload)
        super
        payload[:moped_runtime] = (moped_runtime || 0) + MopedRailsLogger::LogSubscriber.reset_runtime
      end

      module ClassMethods
        def log_process_action(payload)
          messages, moped_runtime = super, payload[:moped_runtime]
          messages << ("Moped: %.1fms" % moped_runtime.to_f) if moped_runtime
          messages
        end
      end
    end
  end
end
