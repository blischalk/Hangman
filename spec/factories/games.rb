# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do |g|
    g.id 2
    factory :game_full, :class => Game do |gf|
      gf.rounds {|a| [a.association(:round)]}
    end
  end
end
