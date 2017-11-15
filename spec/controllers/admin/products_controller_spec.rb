require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  describe 'GET #show' do
    let!(:product_1) { create(:product) }
    before do
     get :show,
     params: { id: product_1.id }
    end

    it { expect(assigns(:product)).to eq(product_1)}
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:product)).to be_a_new(Product) }

  end

  describe 'POST #create' do
    before { post :create, params: product_params }

    context 'when save is successful' do
      let(:product_params) do
        {
          product: attributes_for(:product)
        }
      end
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'when save is unsuccessful' do
      let(:product_params) do
        {
          product: attributes_for(:product, :invalid)
        }
      end
    end
  end

  describe 'GET #edit'do
    # let(:product_1) { create(:product) }
    #   before { get :edit, params: { id: product_1 } }
    #   it { expect(assigns(:product)).to eq(product_1) }
  end

  describe 'PUT/PATCH #update' do
    context 'when update is successful' do
      let!(:product_1) { create(:product) }
        before do
          put :update,
          params:
            {
              id: product_1,
              product: attributes_for(:product, description: 'Update description')
            }
        end
        it { expect(subject).to redirect_to(root_path) }
        it { expect(assigns(:product)).to have_attributes(description: 'Update description') }
    end

    context 'when update is unsuccessful' do
      let!(:product_1) { create(:product) }
      before do
        put :update,
        params:
          {
            id: product_1,
            product: attributes_for(:product, :invalid)
          }
      end
      it { expect(subject).to render_template(:edit) }
    end
  end

  describe 'DELETE #destroy' do
    let!(:product_1) { create(:product) }
    before do
      delete :destroy,
      params: { id: product_1.id }
    end
    it { expect(assigns(:product)).to eq(product_1) }
    it { expect(assigns(:product)).to be_destroyed }
    it { expect(subject).to redirect_to(root_path) }
  end

end
