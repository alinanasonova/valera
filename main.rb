require_relative 'game'
require_relative 'interface'
require_relative 'reader'

class Main
  def initialize
    @game = Game.new
    @interface = Interface.new
    @valera = Valera.new
    @reader = Reader.new
  end

  def start
    loop do
      print "HP: #{@valera.status['hp']}\n"
      print "Mana: #{@valera.status['mana']}\n"
      print "happienss: #{@valera.status['happienss']}\n"
      print "Fatigue: #{@valera.status['fatigue']}\n"
      print "Money: #{@valera.status['money']}\n\n"

      @interface.print_actions
      @reader.read_action(@game)
      @valera = @game.do_action

      if @valera == false
        puts('The End')
        exit
      end
    end
  end
end

main = Main.new
main.start
