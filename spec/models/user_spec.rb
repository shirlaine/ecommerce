require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
    it {expect(subject).to validate_presence_of(:firstname) }
    it {expect(subject).to validate_presence_of(:lastname) }
    it {expect(subject).to validate_presence_of(:username) }
end
