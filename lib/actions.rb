require_relative 'valera'

class Actions
  @act = Actions.new
  def sender(field, key)
    field.send key['operator'], key['value'].to_i
  end
  # def check_cond_status(status, action)
  #  status.each_value{ |value| if !value then return false end }
  #  return true
  # end
  def action_cond(status, action)
    action.each { |field, key| return false unless sender(status[field], key) }
    # check_cond_status(status, action)
    true
  end

  def conds_then_field(status, field, key)
    if key.key?('conds') && action_cond(status, key['conds'])
      sender(field, key['then'])
    else
      sender(field, key)
    end
  end

  def change_status(status, action)
    action.each { |key, value| status[key] = conds_then_field(status, status[key], value) }
    status
  end

  def selected_action(status, action)
    unless action['conds'].nil?
      return unless action_cond(status, action['conds'])

      status = change_status(status, action['effects'])
    end
    status
  end

  def self.execute(status, action)
    if action.to_s.match("{\"save\"=>{}}")
      Saver.save_load_menu(status, 1)
    end
    if action.to_s.match("{\"load\"=>{}}")
      Saver.save_load_menu(status, 2)
    end
    @act.selected_action(status, action)
  end
end