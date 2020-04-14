class ContributorSerializer < ActiveModel::Serializer
  attributes :id, :name, :workload, :country, :admission_date
end
