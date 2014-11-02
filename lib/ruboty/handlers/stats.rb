require "ruboty/stats/actions/clear"
require "ruboty/stats/actions/history"
require "ruboty/stats/actions/stats"

module Ruboty
  module Handlers
    class Stats < Base
      on /stats$/,                   name: 'stats',   description: 'show stats'
      on /stats (?<action_name>.*)/, name: 'history', description: 'show action_name history'
      on /stats clear$/,             name: 'clear',   description: 'clear stats'

      def clear(message)
        Ruboty::Stats::Actions::Clear.new(message).call
      end

      def history(message)
        Ruboty::Stats::Actions::History.new(message).call
      end

      def stats(message)
        Ruboty::Stats::Actions::Stats.new(message).call
      end
    end
  end
end
