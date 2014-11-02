require "ruboty/stats/actions/stats"

module Ruboty
  module Handlers
    class Stats < Base
      on /stats stats/, name: 'stats', description: 'TODO: write your description'

      def stats(message)
        Ruboty::Stats::Actions::Stats.new(message).call
      end
    end
  end
end
