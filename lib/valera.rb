class Valera
  attr_accessor :status

  def initialize(health = 100, mana = 50, happienss = 0, money = 50, fatigue = 50)
    @status = {
      'health' => health,
      'mana' => mana,
      'happienss' => happienss,
      'fatigue' => fatigue,
      'money' => money
    }
  end

  def check_status(status)
    fix_status!(status)
    if check_gameover
      @status = status
      return true
    end
    false
  end
  def check_gameover
    return false if status['health'] < 0
    return false if status['fatigue'] > 100
    return true
  end
  def fix_status!(status)
    status['health'] = 100 if status['health'] > 100
    status['mana'] = 0 if (status['mana']).negative?
    status['mana'] = 100 if (status['mana']) > 100
    status['happienss'] = 10 if status['happienss'] > 10
    status['happienss'] = -10 if status['happienss'] < -10
    status['fatigue'] = 0 if (status['fatigue']).negative?
  end
end
