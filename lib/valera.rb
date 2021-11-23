class Valera
  attr_accessor :status

  def initialize(health = 100, mana = 50, happienss = 50, money = 50, fatigue = 50)
    @status = {
      'health' => health,
      'mana' => mana,
      'happienss' => happienss,
      'fatigue' => fatigue,
      'money' => money
    }
  end

  def check_status(status)
    fix_status(status)
    if check_hp(status['health']) && check_mana(status['mana']) && check_happienss(status['happienss']) \
       && check_fatigue(status['fatigue']) && check_money(status['money'])
      @status = status
      return true
    end
    false
  end

  def fix_status(status)
    status['health'] = 0 if (status['health']).negative?
    status['health'] = 100 if status['health'] > 100
    status['mana'] = 0 if (status['mana']).negative?
    status['happienss'] = 10 if status['happienss'] > 10
    status['fatigue'] = 0 if (status['fatigue']).negative?
  end

  def check_hp(health)
    health.positive?
  end

  def check_mana(mana)
    mana <= 100
  end

  def check_happienss(happienss)
    happienss >= -20
  end

  def check_fatigue(fatigue)
    fatigue <= 100
  end

  def check_money(money)
    money >= 0
  end
end
