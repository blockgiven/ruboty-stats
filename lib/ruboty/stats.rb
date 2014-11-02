require "ruboty"
require "ruboty/stats/version"
require "ruboty/handlers/stats"

module Ruboty
  module Stats
    NAMESPACE = 'stats'

    module Recorder
      def call(handler, message)
        if perform?(handler, message)
          action_name = "#{handler.class.name}##{name}"
          Ruboty::Stats.stats(handler.robot)[action_name] ||= []
          Ruboty::Stats.stats(handler.robot)[action_name] << {body: message.body, time: Time.now}
        end

        super
      end

      def perform?(handler, message)
        message.match pattern_with(handler.robot.name)
      end
    end

    module_function

    def stats(robot)
      robot.brain.data[NAMESPACE] ||= {}
    end
  end
end

::Ruboty::Action.prepend(Ruboty::Stats::Recorder)
