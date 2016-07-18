require 'rails_helper'
describe PrototypesController do
  describe 'with User' do
    login_user
    let(:prototype){ create(:prototype) }

    describe 'GET #index' do
      it 'assigns the requested prototypes to @protos' do
        protos = create_list(:prototype, 1)
        get :index
        expect(assigns(:protos)).to match(protos.sort{ |a, b| b.created_at <=> a.created_at } )
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
        let(:proto) { attributes_for(:prototype, user_id:'1') }
        it 'saves the new prototype in database' do
          expect{
            post :create, prototype: proto
            }.to change(Prototype, :count).by(1)
        end

        it 'redirects to root_path' do
          post :create, prototype: proto
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to show save the prototype successfully' do
          post :create, prototype: proto
          expect(flash[:notice]). to eq( "Your prototype has created successfully." )
        end
      end

      describe 'with invalid attributes' do
      let(:proto) { attributes_for(:prototype, user_id:'1', title: nil) }
        it 'does not save the new prototype in database' do
          expect{
            post :create, prototype: proto
            }.to change(Prototype, :count).by(0)
        end

        it 'redirects to root_path' do
          post :create, prototype: proto
          expect(response).to render_template :new
        end

        it 'shows flash messages to show save the prototype unsuccessfully' do
          post :create, prototype: proto
          expect(flash[:alert]).to eq( 'Error: Please Fill in all blanks !' )
        end
      end
    end

    describe 'GET #show' do
      it "renders the :show template" do
        get :show, id: prototype
        expect(response).to render_template :show
      end

      it "assigns the requested prototype to @prototype" do
        get :show, id: prototype
        expect(assigns(:proto)).to eq prototype
      end

      let(:comment){ create(:comment) }
      it "assigns the requested comment to @comment" do
        get :show, id: prototype
        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end

    describe 'DELETE #destroy' do
      it "deletes the prototype" do
        expect{
          delete :destroy, id: prototype
        }.to change(Prototype,:count).by(0)
      end
    end

    describe 'GET #edit' do
      it "renders the :edit template"do
        get :edit, id: prototype
        expect(response).to render_template :edit
      end

      it "assigns the requested prototype to @prototype" do
         get :edit, id: prototype
         expect(assigns(:proto)).to eq prototype
      end
    end

    describe 'PATCH #update' do
      describe 'with valid attributes' do
        before do
          patch :update, id: prototype.id,
          prototype: attributes_for(:prototype, title: 'updated')
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:proto)).to eq prototype
        end

        it 'updates attributes of prototype' do
          prototype.reload
          expect(prototype.title).to eq 'updated'
        end

        it 'redirects to prototype_path' do
          expect(response).to redirect_to prototype_path
        end
      end
    end
  end

  describe 'without User' do
    let(:prototype){ create(:prototype) }

    describe 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it 'redirects sign_in page' do
        post :create, prototype: attributes_for(:prototype)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects sign_in page' do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
