require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) { create(:admin) }
    it {expect(subject).to validate_presence_of(:firstname) }
    it {expect(subject).to validate_presence_of(:lastname) }
    it {expect(subject).to validate_presence_of(:username) }
end
