require './game'

RSpec.describe Game do
  describe '.game' do
    context 'check_action' do
      game = Game.new
      status = {
        'hp' => 100,
        'mana' => 10,
        'happienss' => -10,
        'fatigue' => 25,
        'money' => 2500
      }
      it { expect(game.check_action(status)).to eq false }
    end

    context 'do_action' do
      game = Game.new
      expected_status = {
        'mana' => 0,
        'happienss' => 0,
        'fatigue' => 30,
        'money' => 1250
      }
      game.action_item = 1
      it { expect(game.do_action.status).to eq expected_status }
    end
  end
end
