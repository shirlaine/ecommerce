require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #edit'do

    let(:product) { create(:product) }
      before { get :edit, params: { id: product } }
      xit { expect (assigns(:product)).to eq(product) }
  end
end
