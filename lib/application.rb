require_relative 'game'
require_relative 'interface'
require_relative 'reader'
require 'json'

class Application
  def initialize
    @game = Game.new
    @interface = Interface.new
    @valera = Valera.new
    @reader = Reader.new
  end

  def open_config
    file = File.read('../valera/config.json')
    JSON.parse(file)
  end

  def action_array(action_hash)
    arr_action = []
    action_hash.each_key { |key| arr_action.push key }
    arr_action
  end

  def run
    action_hash = open_config
    arr_action = action_array(action_hash)
    loop do
      print "HP: #{@valera.status['hp']}\n"
      print "Mana: #{@valera.status['mana']}\n"
      print "happienss: #{@valera.status['happienss']}\n"
      print "Fatigue: #{@valera.status['fatigue']}\n"
      print "Money: #{@valera.status['money']}\n\n"

      @interface.print_actions
      @reader.read_action(@game)
      @valera = @game.do_action(action_hash, arr_action)

      if @valera == false
        puts('The End')
        exit
      end
    end
  end
end

Application.new.run
