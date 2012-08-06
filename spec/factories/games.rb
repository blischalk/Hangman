# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do |g|
    g.id 1
    g.rounds {|a| [a.association(:round)]}
  end
end
