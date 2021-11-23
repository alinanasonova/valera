require './lib/game'
require 'json'
require './lib/valera'
RSpec.describe Game do
  describe '.game' do
    game = Game.new
    status = {
      'hp' => 100,
      'mana' => 50,
      'happienss' => 50,
      'fatigue' => 50,
      'money' => 50
    }
    action_item = 1
    file = File.read('./config.json')
    action_hash = JSON.parse(file)
    arr_action = ["Go work"]

    #context 'do_action' do
    #  exp = {
    #    'hp' => 100,
    #    'mana' => 20,
    #    'happienss' => 45,
    #    'fatigue' => 120,
    #    'money' => 200
    #  }
    #  
    #  it { expect(game.do_action(action_hash, arr_action)).to eq exp }
    #end
    context 'action_menu' do
      expected_status = {
        'hp' => 100,
        'mana' => 20,
        'happienss' => 45,
        'fatigue' => 120,
        'money' => 200
      }
      it { expect(game.action_menu(status, action_item, action_hash, arr_action)).to eq expected_status }
    end
  end
end
