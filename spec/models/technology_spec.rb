require 'rails_helper'

describe Technology, type: :model do
  subject(:technology) { build(:technology) }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:projects) }
  end

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
  end
end
