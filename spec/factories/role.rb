FactoryBot.define do
  factory :role do
    name  { Role.names.keys.sample }
  end
end
