require './lib/saver'

RSpec.describe Saver do
  describe '.saver' do
    context 'save_load_menu' do
      status = {
        'hp' => 100,
        'mana' => 10,
        'happienss' => -1,
        'fatigue' => 25,
        'money' => 2500
      }

      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        Saver.save_load_menu(status, 9)
        curr_status = Saver.save_load_menu(status, 8)
        expect(curr_status).to eq status
      }
    end
  end
end
