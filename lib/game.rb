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
    abort 'Game Over' if action_item.zero?
    selected_action_ = action_hash[arr_action[action_item - 1]]
    Actions.new.execute!(status, selected_action_)
  end

  def choose_action!(action_hash, arr_action)
    do_action!(@valera.status, @action_item, action_hash, arr_action)
    system('clear')
    @valera.fix_status!(@valera.status)
    return abort 'YOU DIED' if @valera.dead?(@valera.status)

    valera
  end
end
