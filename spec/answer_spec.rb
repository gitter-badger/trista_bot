require './lib/trista_bot/answer'

describe TristaBot::Answer do
  describe "#answer" do
    it "supports 'da' handler" do
      expect(TristaBot::Answer.new(double("message", text: "да?")).answer).to eq('ПИЗДА')
    end
  end

  it "supports 'somneniya_est' handler" do
    expect(TristaBot::Answer.new(double("message", text: "годен я, сомнений нет, лучше сделай мне минет")).answer).to eq("А СОМНЕНЬЯ ЕСТЬ ВСЕГДА, ЛУЧШЕ НЮХАЙ ТРИ ХУЯ")
  end

  it "supports 'somneniy_net' handler" do
    expect(TristaBot::Answer.new(double("message", text: "в трактористы ты не годен, отсоси и будь свободен")).answer).to eq("ГОДЕН Я, СОМНЕНИЙ НЕТ, ЛУЧШЕ СДЕЛАЙ МНЕ МИНЕТ")
  end

  it "supports 'ne_goden' handler" do
    expect(TristaBot::Answer.new(double("message", text: "тракторист сегодня я, отсоси ты у меня")).answer).to eq("В ТРАКТОРИСТЫ ТЫ НЕ ГОДЕН, ОТСОСИ И БУДЬ СВОБОДЕН")
  end

  it "supports 'reverse_traktorist' handler" do
    expect(TristaBot::Answer.new(double("message", text: "отсоси у тракториста")).answer).to eq("ТРАКТОРИСТ СЕГОДНЯ Я, ОТСОСИ ТЫ У МЕНЯ")
  end

  it "supports 'traktorist' handler" do
    expect(TristaBot::Answer.new(double("message", text: "триста")).answer).to eq("ОТСОСИ У ТРАКТОРИСТА")
  end

  it "supports 'pidor' handler" do
    expect(TristaBot::Answer.new(double("message", text: "нет")).answer).to eq("ПИДОРА ОТВЕТ")
  end

  it "supports 'pomponil' handler" do
    expect(TristaBot::Answer.new(double("message", text: "понял")).answer).to eq("Я ТВОЙ ПОНЯЛ НА ХУЮ ПУМПОНИЛ")
  end

  it "supports 'hui_na' handler" do
    expect(TristaBot::Answer.new(double("message", text: "а?")).answer).to eq("ХУЙ НА")
  end

  it "supports 'hui' handler" do
    expect(TristaBot::Answer.new(double("message", text: "грустный")).answer).to eq("ХУЙ СОСАЛ НЕВКУСНЫЙ???")
  end


end
