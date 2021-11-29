require_relative 'valera'

class Actions
  def change(field, key)
    field.send key['operator'], key['value'].to_i
  end

  def check_action_cond(status, action)
    action.each { |field, key| return false unless change(status[field], key) }
    true
  end

  def check_conds_then_field(status, field, key)
    if key.key?('conds') && check_action_cond(status, key['conds'])
      change(field, key['then'])
    else
      change(field, key)
    end
  end

  def change_status(status, action)
    action.each { |key, value| status[key] = check_conds_then_field(status, status[key], value) }
    status
  end

  def select_action(status, action)
    unless action['conds'].nil?
      return unless check_action_cond(status, action['conds'])

      status = change_status(status, action['effects'])
    end
    status
  end

  def execute!(status, action)
    if action.to_s.match("{\"save\"=>{}}")
      Saver.save_load_menu(status, 1)
    end
    if action.to_s.match("{\"load\"=>{}}")
      Saver.save_load_menu(status, 2)
    end
    select_action(status, action)
  end
end