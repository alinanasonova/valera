require_relative 'valera'

class Actions
  def change(field, key)
    field.send key['operator'], key['value'].to_i
  end

  def check_action_cond(status, action)
    action.each { |field, key| return false unless self.change(status[field], key) }
    true
  end

  def check_conds_then_field(status, field, key)
    if key.key?('conds') && self.check_action_cond(status, key['conds'])
      self.change(field, key['then'])
    else
      self.change(field, key)
    end
  end

  def change_status(status, action)
    action.each { |key, value| status[key] = self.check_conds_then_field(status, status[key], value) }
    status
  end

  def select_action(status, action)
    unless action['conds'].nil?
      return unless self.check_action_cond(status, action['conds'])

      status = self.change_status(status, action['effects'])
    end
    status
  end

  def execute!(status, action)
    Saver.save_load_menu(status, 1) if action.to_s.match('{"save"=>{}}')
    Saver.save_load_menu(status, 2) if action.to_s.match('{"load"=>{}}')
    after_action = self.select_action(status, action)
    puts "You can't do it" if after_action.nil?
    after_action
  end
end
