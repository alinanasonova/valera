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
  def do_action!(status, action_item, action_hash, arr_action)
    if action_item == 0
      abort 'Game Over'
    end
    selected_action_ = action_hash[arr_action[action_item - 1]]
    Actions.new.execute!(status, selected_action_)
  end

  def choose_action!(action_hash, arr_action)
    do_action(@valera.status, @action_item, action_hash, arr_action)
    system('clear')
    return abort 'YOU DIED' if !@valera.check_status(@valera.status)

    valera
  end
end
