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

  def action_menu(status, action_item, action_hash, arr_action)
    # p action_menu.class
    case action_item
    when 1..7
      selected_action_ = action_hash[arr_action[action_item - 1]]
      Actions.execute(status, selected_action_)
    when 8
      Saver.save_load_menu(status, 7)
    when 9
      Saver.save_load_menu(status, 8)
    when 0
      abort 'Game Over'
    end
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
