require 'rails_helper'

describe Role do
  subject(:role) { build(:role) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:name) }
end
