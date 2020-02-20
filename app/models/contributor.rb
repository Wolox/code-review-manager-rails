class Contributor < ApplicationRecord
  WORKLOADS = [20, 25, 30, 40].freeze
  enum contributor_type: { contributor: 0, admin: 1 }
  enum country: { argentina: 0, chile: 1, colombia: 2 }
  validates :name, :country, :workload, :admission_date, :contributor_type, presence: true
  validate :valid_workload
  validate :admission_date_until_today

  def admission_date_until_today
    return if admission_date.blank?

    errors.add(:future_admission_date, 'cant be a date after today') unless
      admission_date < 1.day.from_now.to_date
  end

  def valid_workload
    errors.add(:invalid_workload, 'invalid workload, must be 20, 25, 30 or 40') unless
      workload.in?(WORKLOADS)
  end
end