class ContributorSerializer < ActiveModel::Serializer
  attributes :name, :workload, :country, :admission_date
end
