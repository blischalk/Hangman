# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :round do
    id 2
    phrase {|a| a.association(:phrase) }
  end
end
