module TristaBot
  SUPPORTED_ANSWERS = {
    somneniya_est: "А СОМНЕНЬЯ ЕСТЬ ВСЕГДА, ЛУЧШЕ НЮХАЙ ТРИ ХУЯ",
    somneniy_net: "ГОДЕН Я, СОМНЕНИЙ НЕТ, ЛУЧШЕ СДЕЛАЙ МНЕ МИНЕТ",
    ne_goden: "В ТРАКТОРИСТЫ ТЫ НЕ ГОДЕН, ОТСОСИ И БУДЬ СВОБОДЕН",
    reverse_traktorist: "ТРАКТОРИСТ СЕГОДНЯ Я, ОТСОСИ ТЫ У МЕНЯ",
    traktorist: "ОТСОСИ У ТРАКТОРИСТА",
    pidor: "ПИДОРА ОТВЕТ",
    pomponil: "Я ТВОЙ ПОНЯЛ НА ХУЮ ПУМПОНИЛ",
    hui_na: "ХУЙ НА",
    hui: "ХУЙ СОСАЛ НЕВКУСНЫЙ???",
  }

  class Answer
    def initialize(message)
      @message = message
      @index = SUPPORTED_ANSWERS.keys.index { |answer| send("#{answer}_matches?") }
    end

    def answer
      SUPPORTED_ANSWERS[event]
    end

    def event
      SUPPORTED_ANSWERS.keys[@index]
    end

    def found?
      @index
    end

    private

      def text
        @message.text&.downcase || ''
      end

      def somneniya_est_matches?
        text.include?('годен') && text.include?('я') && text.include?('сомнений') && text.include?('нет') && text.include?('лучше') && text.include?('сделай') && text.include?('мне') && text.include?('минет')
      end

      def somneniy_net_matches?
        text.include?('в') && text.include?('трактористы') && text.include?('ты') && text.include?('не') && text.include?('годен') && text.include?('отсоси') && text.include?('и') && text.include?('будь') && text.include?('свободен')
      end

      def ne_goden_matches?
        text.include?('тракторист') && text.include?('сегодня') && text.include?('я') && text.include?('отсоси') && text.include?('ты') && text.include?('у') && text.include?('меня')
      end

      def reverse_traktorist_matches?
        text.include?('отсоси') && text.include?('у') && text.include?('тракториста')
      end

      def traktorist_matches?
        %w[300 ста сты].include?(text[-3..-1])
      end

      def pidor_matches?
        text.end_with?('нет')
      end

      def pomponil_matches?
        %w[понял понил понел].include?(text.delete('?')[-5..-1])
      end

      def hui_na_matches?
        text.include?(' а?') || text == 'а?'
      end

      def hui_matches?
        text.end_with?('устный') || text.end_with?('усный')
      end
  end
end
