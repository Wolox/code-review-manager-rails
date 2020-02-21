require 'rails_helper'

describe Technology do
  context 'when a valid technology is built' do
    subject(:technology) { build(:technology) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when a valid technology is created' do
    subject(:technology) { create(:technology) }

    it { is_expected.to be_persisted }
  end
end
