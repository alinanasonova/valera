require './actions'

RSpec.describe Actions do
  describe '.actions' do
    status = {
      'hp' => 100,
      'mana' => 30,
      'happienss' => 5,
      'fatigue' => 0,
      'money' => 300
    }

    context 'go_work' do
      expected = {
        'hp' => 100,
        'happienss' => 0,
        'mana' => 0,
        'money' => 400,
        'fatigue' => 70
      }
      it { expect(Actions.go_work(status.clone)).to eq expected }
    end
    context 'see_nature' do
      expected = {
        'hp' => 100,
        'mana' => 20,
        'happienss' => 6,
        'fatigue' => 10,
        'money' => 300
      }
      it { expect(Actions.see_nature(status.clone)).to eq expected }
    end
    context 'see_serial' do
      expected = {
        'hp' => 95,
        'mana' => 60,
        'happienss' => 4,
        'fatigue' => 10,
        'money' => 280
      }
      it { expect(Actions.see_serial(status.clone)).to eq expected }
    end
    context 'drink_with_marginals' do
      expected = {
        'hp' => 20,
        'mana' => 120,
        'happienss' => 10,
        'fatigue' => 80,
        'money' => 150
      }
      it { expect(Actions.drink_with_marginals(status.clone)).to eq expected }
    end
    context 'sing' do
      expected = {
        'hp' => 100,
        'mana' => 40,
        'happienss' => 6,
        'fatigue' => 20,
        'money' => 310
      }
      it { expect(Actions.sing(status.clone)).to eq expected }
    end
    context 'sleep' do
      expected = {
        'hp' => 100,
        'mana' => -20,
        'happienss' => 5,
        'fatigue' => -70,
        'money' => 300
      }
      it { expect(Actions.sleep(status.clone)).to eq expected }
    end
  end
end
