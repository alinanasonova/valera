class Valera
  attr_accessor :status

  def initialize(hp = 100, mana = 0, happienss = 0, money = 0, fatigue = 0)
    @status = {
      'hp' => hp,
      'mana' => mana,
      'happienss' => happienss,
      'fatigue' => fatigue,
      'money' => money
    }
  end

  def check_status(status)
    fix_status(status)
    if check_hp(status['hp']) && check_mana(status['mana']) && check_happienss(status['happienss']) \
       && check_fatigue(status['fatigue']) && check_money(status['money'])
      @status = status
      return true
    end
    false
  end

  def fix_status(status)
    status['hp'] = 0 if (status['hp']).negative?
    status['hp'] = 100 if status['hp'] > 100
    status['mana'] = 0 if (status['mana']).negative?
    status['happienss'] = 10 if status['happienss'] > 10
    status['fatigue'] = 0 if (status['fatigue']).negative?
  end

  def check_hp(hp)
    hp > 0 && hp <= 100
  end

  def check_mana(mana)
    mana >= 0 && mana <= 100
  end

  def check_happienss(happienss)
    happienss <= 10
  end

  def check_fatigue(fatigue)
    fatigue >= 0 && fatigue <= 100
  end

  def check_money(money)
    money >= 0
  end
end
