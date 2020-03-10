require 'rails_helper'

describe Project, type: :model do
  subject(:project) { build(:project) }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:technologies) }
  end

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
  end
end
