require 'telegram/bot'
require 'telegram/bot/botan'
require 'unicode'
require 'dotenv/load'
require 'byebug'

class String
  def downcase
    Unicode::downcase(self)
  end
end
token = ENV["TELEGRAM_TOKEN"]
def track(event, message, bot)
  chat_name = if message.chat.type == "private"
    "#{message.chat.first_name} #{message.chat.last_name} (#{message.chat.username})"
  else
    message.chat.title
  end
  bot.track(event, message.from.id, {
    sender: {
      id: message.from.id,
      name: "#{message.from.first_name} #{message.from.last_name}",
      username: message.from.username
    },
    chat_name: chat_name,
    text: message.text
  })
end
Telegram::Bot::Client.run(token, logger: Logger.new($stderr)) do |bot|
  bot.enable_botan!(ENV["BOTAN_TOKEN"])
  bot.listen do |message|
    if text = message.text
      text = text.downcase

      if text.include?('годен') && text.include?('я') && text.include?('сомнений') && text.include?('нет') && text.include?('лучше') && text.include?('сделай') && text.include?('мне') && text.include?('минет')
        bot.api.send_message(chat_id: message.chat.id, text: "А СОМНЕНЬЯ ЕСТЬ ВСЕГДА, ЛУЧШЕ НЮХАЙ ТРИ ХУЯ")
        track('somneniya_est', message, bot)
      elsif text.include?('в') && text.include?('трактористы') && text.include?('ты') && text.include?('не') && text.include?('годен') && text.include?('отсоси') && text.include?('и') && text.include?('будь') && text.include?('свободен')
        bot.api.send_message(chat_id: message.chat.id, text: "ГОДЕН Я, СОМНЕНИЙ НЕТ, ЛУЧШЕ СДЕЛАЙ МНЕ МИНЕТ")
        track('somneniy_net', message, bot)
      elsif text.include?('тракторист') && text.include?('сегодня') && text.include?('я') && text.include?('отсоси') && text.include?('ты') && text.include?('у') && text.include?('меня')
        bot.api.send_message(chat_id: message.chat.id, text: "В ТРАКТОРИСТЫ ТЫ НЕ ГОДЕН, ОТСОСИ И БУДЬ СВОБОДЕН")
        track('ne_goden', message, bot)
      elsif text.include?('отсоси') && text.include?('у') && text.include?('тракториста')
        bot.api.send_message(chat_id: message.chat.id, text: "ТРАКТОРИСТ СЕГОДНЯ Я, ОТСОСИ ТЫ У МЕНЯ")
        track('reverse_traktorist', message, bot)
      elsif %w[300 ста сты].include?(text[-3..-1])
        bot.api.send_message(chat_id: message.chat.id, text: "ОТСОСИ У ТРАКТОРИСТА")
        track('traktorist', message, bot)
      elsif text.end_with?('нет')
        bot.api.send_message(chat_id: message.chat.id, text: "ПИДОРА ОТВЕТ")
        track('pidor', message, bot)
      elsif %w[понял понил понел].include?(text.delete('?')[-5..-1])
        bot.api.send_message(chat_id: message.chat.id, text: "Я ТВОЙ ПОНЯЛ НА ХУЮ ПУМПОНИЛ")
        track('pomponil', message, bot)
      else
        text = text.delete('?')
        if text.end_with?('устный') || text.end_with?('усный')
          bot.api.send_message(chat_id: message.chat.id, text: "ХУЙ СОСАЛ НЕВКУСНЫЙ???")
          track('hui', message, bot)
        end
      end
    end
  end
end
