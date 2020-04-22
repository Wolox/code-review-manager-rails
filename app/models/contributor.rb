class Contributor < ApplicationRecord
  enum workload: { '20': 0, '25': 1, '30': 2, '40': 3 }
  enum country: { argentina: 0, chile: 1, colombia: 2 }
  validates :name, :country, :workload, :admission_date, presence: true
  validates :workload, inclusion: { in: workloads.keys }
  validates :country, inclusion: { in: countries.keys }
  validate :admission_date_until_today
  has_many :job_assignations, dependent: :nullify
  has_many :roles, through: :job_assignations

  def admission_date_until_today
    return if admission_date.blank?

    errors.add(:future_admission_date, 'cant be a date after today') unless
      admission_date < 1.day.from_now.to_date
  end
end
