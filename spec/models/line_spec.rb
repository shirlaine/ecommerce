require 'rails_helper'

RSpec.describe Line, type: :model do
  let (:subject) { create(:line) }
  it { expect(subject).to validate_presence_of(:price) }
  it { expect(subject).to belong_to(:product) }
end
