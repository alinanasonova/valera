require_relative 'valera'

class Menu
  def initialize
    file = File.read('../valera/config.json')
    action_hash = JSON.parse(file)
    @arr_action = []
    action_hash.each_key { |key| @arr_action.push key }
  end

  def print_actions
    @arr_action.map.with_index { |action, i| print "(#{i + 1}) - #{action}\n" }
    puts '(0) - Exit'
  end
end
