require_relative 'valera'

class Actions
  def self.go_work(status)
    status['happienss'] -= 5
    status['mana'] -= 30
    status['money'] += 100
    status['fatigue'] += 70
    status
  end

  def self.see_nature(status)
    status['happienss'] += 1
    status['mana'] -= 10
    status['fatigue'] += 10
    status
  end

  def self.see_serial(status)
    status['happienss'] -= 1
    status['mana'] += 30
    status['fatigue'] += 10
    status['hp'] -= 5
    status['money'] -= 20
    status
  end

  def self.go_to_bar(status)
    status['happienss'] += 1
    status['mana'] += 60
    status['fatigue'] += 40
    status['hp'] -= 10
    status['money'] -= 100
    status
  end

  def self.drink_with_marginals(status)
    status['happienss'] += 5
    status['hp'] -= 80
    status['mana'] += 90
    status['fatigue'] += 80
    status['money'] -= 150
    status
  end

  def self.sing(status)
    status['happienss'] += 1
    status['mana'] += 10
    status['money'] += 10
    status['money'] += 50 if (status['mana'] > 40 && status['mana'] < 70)
    status['fatigue'] += 20
    status
  end

  def self.sleep(status)
    status['hp'] += 90 if status['mana'] < 30
    status['happienss'] -= 3 if status['mana'] > 70
    status['fatigue'] -= 70
    status['mana'] -= 50
    status
  end
end
