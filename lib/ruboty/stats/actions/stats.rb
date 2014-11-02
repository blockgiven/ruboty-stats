module Ruboty
  module Stats
    module Actions
      class Stats < Ruboty::Actions::Base
        def call
          stats = ::Ruboty::Stats.stats(message.robot).map {|action_name, message_bodies|
            {action_name: action_name, count: message_bodies.size}
          }.sort_by(&:count)

          name_column_size  = stats.map {|s| s[:action_name].to_s.size }.max
          count_column_size = stats.map {|s| s[:count].to_s.size }.max

          stats_message = stats.map {|s|
            "%-#{name_column_size}s | %#{count_column_size}s"
            "%-#{name_column_size}s | %#{count_column_size}s" % [s[:action_name], s[:count]]
          }.join($/)

          message.reply(stats_message)
        end
      end
    end
  end
end
