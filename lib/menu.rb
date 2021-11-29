require_relative 'valera'

class Menu
  def initialize
    file = File.read('../valera/config.json')
    action_hash = JSON.parse(file)
    @arr_action = []
    action_hash.each_key { |key| @arr_action.push key }
  end
  def print_actions
    @arr_action.map.with_index { |action, i| print "(#{i+1}) - #{action}\n" }
    # puts '(1) - Go to work'
    # puts '(2) - See nature'
    # puts '(3) - Drink wine and see serial'
    # puts '(4) - Go to bar'
    # puts '(5) - Drink with marginals'
    # puts '(6) - Sing in the subway'
    # puts '(7) - Go to sleep'
    puts '(8) - Save game'
    puts '(9) - Load game'
    puts '(0) - Exit'
  end
end
