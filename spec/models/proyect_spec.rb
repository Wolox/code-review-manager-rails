require 'rails_helper'

describe Proyect, type: :model do
  subject(:proyect) { build(:proyect) }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:technologies) }
  end

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
  end
end
