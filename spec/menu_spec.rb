require './lib/menu'

RSpec.describe Menu do
  describe '#print_actions' do
    it 'Output menu' do
      expect do
        Menu.new.print_actions
      end.to output("(1) - Go work\n(2) - See nature\n(3) - See serial\n(4) - Go to bar\n(5) - Drink with marginals\n(6) - Sing\n(7) - Sleep\n(8) - Save\n(9) - Load\n(0) - Exit\n").to_stdout
    end
  end
end
