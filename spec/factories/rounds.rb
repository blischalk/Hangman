# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :round do
    id 1
    phrase {|a| a.association(:phrase) }
  end
end
