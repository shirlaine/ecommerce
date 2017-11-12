require 'rails_helper'

RSpec.describe Product, type: :model do
  # it has a valid factory
  # it is invalid without a name
  # it is invalid without product description
  # it must have a display photo
  let(:subject) { create(:product)}
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:description) }
  it { expect(subject).to validate_presence_of(:image) }
  it { expect(subject).to have_many(:lines) }
end
