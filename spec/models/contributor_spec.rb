require 'rails_helper'

describe Contributor do
  subject(:contributor) { build(:contributor) }

  it { is_expected.to be_valid }
  it { is_expected.to define_enum_for(:country).with_values(described_class.countries.keys) }
  it { is_expected.to define_enum_for(:workload).with_values(described_class.workloads.keys) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:workload) }
  it { is_expected.to validate_presence_of(:country) }
  it { is_expected.to validate_presence_of(:admission_date) }

  context 'with future date' do
    subject(:contributor) { build(:contributor, admission_date: 3.days.from_now.to_date) }

    it { is_expected.to be_invalid }

    it 'returns invalid workload error' do
      contributor.valid?
      expect(contributor.errors.messages.keys).to include(:future_admission_date)
    end
  end
end
