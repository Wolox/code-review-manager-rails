FactoryBot.define do
  factory :contributor do
    name  { Faker::Lorem.word }
    workload        { Contributor.workloads.keys.sample }
    country         { Contributor.countries.keys.sample }
    admission_date  { Faker::Date.between(from: 2.weeks.ago, to: Time.zone.now.to_date) }

    trait :admin do
      contributor_type { :admin }
    end
  end
end
