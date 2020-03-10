FactoryBot.define do
  factory :project do
    name { Faker::Science.element }
  end
end
