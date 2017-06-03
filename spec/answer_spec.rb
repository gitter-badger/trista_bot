require './lib/trista_bot/answer'

describe TristaBot::Answer do
  describe "#answer" do
    it "supports 'da' handler" do
      expect(TristaBot::Answer.new(double("message", text: "да?")).answer).to eq('ПИЗДА')
    end
  end
end
