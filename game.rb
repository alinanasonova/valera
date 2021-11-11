require_relative 'valera'
require_relative 'actions'
require_relative 'saver'

class Game
  attr_accessor :action_item, :valera, :actions

  @actions = {
    1 => ->(status) { Actions.go_work(status) },
    2 => ->(status) { Actions.see_nature(status) },
    3 => ->(status) { Actions.see_serial(status) },
    4 => ->(status) { Actions.go_to_bar(status) },
    5 => ->(status) { Actions.drink_with_marginals(status) },
    6 => ->(status) { Actions.sing(status) },
    7 => ->(status) { Actions.sleep(status) },
    8 => ->(status) { Saver.save_load_menu(status, 7) },
    9 => ->(status) { Saver.save_load_menu(status, 8) },
    0 => ->(_status) { exit }
  }

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

  def do_action
    status = Game.actions[@action_item].call(@valera.status.clone)
    system('clear')
    puts("\nCant do it") if check_action(status)
    return false if @valera.status['happienss'] <= -10

    valera
  end
end
