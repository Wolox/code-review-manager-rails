require 'rails_helper'

describe JobAssignation do
  subject(:job_assignation) { build(:job_assignation) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:role) }
  it { is_expected.to validate_presence_of(:contributor) }
  it { is_expected.to belong_to(:role) }
  it { is_expected.to belong_to(:contributor) }
end
