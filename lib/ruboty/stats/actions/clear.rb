module Ruboty
  module Stats
    module Actions
      class Clear < Ruboty::Actions::Base
        def call
          ::Ruboty::Stats.stats(message.robot).delete_if { true }
          message.reply("good bye stats.")
        end
      end
    end
  end
end
