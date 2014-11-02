module Ruboty
  module Stats
    module Actions
      class History < Ruboty::Actions::Base
        def call
          history = (::Ruboty::Stats.stats(message.robot)[message[:action_name]] || []).sort_by {|h| h[:time] }
          history_message = history.map {|h| "#{h[:time]} #{h[:body]}" }.join($/)
          message.reply(history_message)
        end
      end
    end
  end
end
