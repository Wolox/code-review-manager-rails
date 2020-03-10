class Technology < ApplicationRecord
  has_and_belongs_to_many :proyects

  validates :name, presence: true
end
