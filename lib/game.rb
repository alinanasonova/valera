require_relative 'valera'
require_relative 'actions'
require_relative 'saver'

class Game
  attr_accessor :action_item, :valera, :actions

  def initialize
    @valera = Valera.new
  end

  class << self
    attr_reader :actions
  end
  def check_action(status)
    return (@valera.status['mana'] >= 50) || (@valera.check_status(status) == false) || (@valera.status['fatigue'] >= 10) if @action_item == 1

    @valera.check_status(status) == false
  end
  def action_menu(status, action_item, action_hash, arr_action)
    # p action_menu.class
    if action_item == 0
      abort 'Game Over'
    end
    selected_action_ = action_hash[arr_action[action_item - 1]]
    Actions.execute(status, selected_action_)
  end

  def do_action(action_hash, arr_action)
    action_menu(@valera.status, @action_item, action_hash, arr_action)
    system('clear')
    # puts("\nCant do it") if check_action(@valera.status)
    # p status
    return false if @valera.status['happienss'] <= -10

    valera
  end
end
