require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:admin_1) { create(:admin) }
  before { sign_in admin_1 }

  describe 'GET #index' do
    let!(:product_1) { create(:product) } #last step
    before { get :index }
    it { expect(assigns(:products).count).to eq(1) }
  end

end
