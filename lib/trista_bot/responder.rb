module TristaBot
  class Responder
    def initialize(bot, message)
      @bot = bot
      @message = message
    end

    def respond
      answer = TristaBot::Answer.new(@message)

      if answer.found?
        send_message(answer.answer)
        track(answer.event)
      end
    end

    private

    def send_message(text)
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    end

    def track(event)
      TristaBot::Tracker.new(@bot).track(event, @message)
    end
  end
end
