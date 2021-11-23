require './lib/actions'

RSpec.describe Actions do
  describe '.actions' do
    status = {
      'hp' => 10,
      'mana' => 10,
      'happienss' => 10,
      'fatigue' => 10,
      'money' => 10
    }
    action = {
      "conds"=>{
        "mana"=>{
            "value"=> "50",
            "operator"=> "<"
        }
      },
      "effects"=>{
        "happienss"=>{
            "value"=> "10",
            "operator"=> "+"
        },
        "mana"=>{
            "value"=> "10",
            "operator"=> "+"
        },
        "money"=>{
            "value"=> "10",
            "operator"=> "+",
            "conds"=>{
                "happienss"=>{
                    "value"=> "30",
                    "operator"=> ">"
                }
            },
            "then"=>{
                "value"=> "150",
                "operator"=> "+"
            }
        },
        "fatigue"=>{
            "value"=> "10",
            "operator"=> "+"
        }
    }}
    context 'sender' do
      key = {"value"=>"10", "operator"=>"+"}
      expected = 20
      it { expect(Actions.new.sender(status["hp"], key)).to eq expected }
    end
    context 'action_cond' do
      action_cond_ = {
        "mana" => {
          "value" => "5", 
          "operator" => ">"
        }
      }
      expected = true
      it { expect(Actions.new.action_cond(status.clone, action_cond_)).to eq expected }
    end
    context 'conds_then_field' do
      key = {
        "value"=>"10", 
        "operator"=>"+", 
        "conds"=>{
          "happienss"=>{
            "value"=>"20", 
            "operator"=>">"
          }
        }, 
        "then"=>{
            "value"=>"20", 
            "operator"=>"+"
        }
      }
      expected = 20
      it { expect(Actions.new.conds_then_field(status, status["money"], key)).to eq expected }
    end
    context 'change_status' do
      expected = {
        "hp"=>10, 
        "mana"=>20, 
        "happienss"=>20, 
        "fatigue"=>20, 
        "money"=>20
      }
      it { expect(Actions.new.change_status(status.clone, action['effects'])).to eq expected }
    end
    context 'selected_action' do
      expected = {
        "hp"=>10, 
        "mana"=>20, 
        "happienss"=>20, 
        "fatigue"=>20, 
        "money"=>20
      }
      it { expect(Actions.new.selected_action(status.clone, action)).to eq expected }
    end
  end
end
