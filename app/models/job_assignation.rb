class JobAssignation < ApplicationRecord
  validates :role, :contributor, presence: true

  belongs_to :role
  belongs_to :contributor
end
