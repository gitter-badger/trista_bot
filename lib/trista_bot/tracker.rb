module TristaBot
  class Tracker
    def initialize(bot)
      @bot = bot
    end

    def track(event, message)
      chat_name = if message.chat.type == "private"
        "#{message.chat.first_name} #{message.chat.last_name} (#{message.chat.username})"
      else
        message.chat.title
      end

      @bot.track(event, message.from.id, {
        sender: {
          id: message.from.id,
          name: "#{message.from.first_name} #{message.from.last_name}",
          username: message.from.username
        },
        chat_name: chat_name,
        text: message.text
      })
    end
  end
end
