require './valera'

RSpec.describe Valera do
  describe '.valera' do
    valera = Valera.new
    context 'check_true' do
      status = {
        'hp' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 1000
      }
      it { expect(valera.check_status(status)).to eq true }
    end
    context 'check_false' do
      status = {
        'hp' => 30,
        'mana' => 250,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 1000
      }
      it { expect(valera.check_status(status)).to eq false }
    end
    context 'check_false' do
      status = {
        'hp' => 30,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 250,
        'money' => 1000
      }
      it { expect(valera.check_status(status)).to eq false }
    end
  end
end
