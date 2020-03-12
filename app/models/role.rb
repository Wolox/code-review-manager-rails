class Role < ApplicationRecord
  enum name: { developer: 0, tech_leader: 1, engineer_manager: 2, team_manager: 3,
               code_reviewer: 4 }

  validates :name, presence: true

  has_many :job_assignations, dependent: :nullify
  has_many :contributors, through: :job_assignations
end
