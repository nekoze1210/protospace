require 'rails_helper'

describe PrototypesController do
  describe 'GET #index' do
    it 'assigns the requested prototypes to @protos' do
      protos = create_list(:prototype, 3)
      get :index
      expect(assigns(:protos)).to match(protos)
    end

    it "renders the 'index' template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    describe 'with valid attributes' do
      it 'saves the new prototype in database' do

      end

      it 'redirects to root_path' do
      end

      it 'shows flash messages to show save the prototype successfully' do
      end
    end

    describe 'with invalid attributes' do
      it 'does not save the new prototype in database' do
      end

      it 'redirects to new_prototype_path' do
      end

      it 'shows flash messages to show save the prototype unsuccessfully' do
      end

    end
  end
end
