require 'json'

class Saver
  def self.save_game(status, filename)
    file = File.open(filename, 'w')
    file.write(JSON.dump(status))
    file.close
  end

  def self.load_game(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def self.save_load_menu(status, choice)
    filename = ''

    loop do
      printf "enter file name\ninput >> "
      filename = "./saves/#{$stdin.gets.strip}.json"
      break unless !File.file?(filename) && (choice == 2)

      puts 'YOU DIED'
    end

    case choice
    when 1
      save_game(status, filename)
      status
    when 2
      load_game(filename)
    end
  end
end
