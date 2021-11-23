require './lib/game'
require 'json'
require './lib/valera'
require 'stringio'

module Kernel
  def capture_stdout(console_input = '')
    $stdin = StringIO.new(console_input)
    out = StringIO.new
    $stdout = out
    yield
    out.string.strip
  ensure
    $stdout = STDOUT
    $stdin = STDIN
  end
end

RSpec.describe Game do
  describe '.game' do
    game = Game.new
    status = {
      'health' => 100,
      'mana' => 50,
      'happienss' => 20,
      'fatigue' => 50,
      'money' => 50
    }
    action_item = 1
    file = File.read('./config.json')
    action_hash = JSON.parse(file)
    arr_action = ['Go work']

    # context 'do_action' do
    #  exp = {
    #    'health' => 100,
    #    'mana' => 20,
    #    'happienss' => 45,
    #    'fatigue' => 120,
    #    'money' => 200
    #  }
    #
    #  it { expect(game.do_action(action_hash, arr_action)).to eq exp }
    # end
    context 'action_menu' do
      expected_status = {
        'health' => 100,
        'mana' => 20,
        'happienss' => 15,
        'fatigue' => 120,
        'money' => 150
      }
      it { expect(game.action_menu(status, action_item, action_hash, arr_action)).to eq expected_status }
    end

    # context 'action_menu' do
    #  expected_status = {
    #    'health' => 100,
    #    'mana' => 20,
    #    'happienss' => 45,
    #    'fatigue' => 120,
    #    'money' => 200
    #  }
    #  resque
    #  action_item = 0
    #  it { expect(game.action_menu(status, action_item, action_hash, arr_action)).to output("Game Over").to_stderr }
    # end
    # describe '.program exit' do
    #  it 'aaaaa' do
    ##    expect do
    ##      input = '0'
    #      capture_stdout(input) do
    #        Game.new.action_menu(status, action_item, action_hash, arr_action)
    #      rescue SystemExit
    #        nil
    #      end
    #    end.to output("Game Over\n").to_stderr
    #  end
    # end
  end
end
