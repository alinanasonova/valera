require './lib/saver'

RSpec.describe Saver do
  describe '#save_load_menu' do
    context 'Try save game' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }

      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        Saver.save_load_menu(status, 2)
        curr_status = Saver.save_load_menu(status, 1)
        expect(curr_status).to eq status
      }
    end
  end
end
