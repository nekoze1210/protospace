require 'rails_helper'

describe UsersController do

  context 'with User' do
    login_user
    let(:user){ create(:user) }

    describe 'GET #show' do
      it 'assigns the requested user to @user' do
        get :show, id: user
        expect(assigns(:user)).to eq user
      end

      it 'renders the :show templates' do
        get :show, id: user
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested user to @user' do
        get :edit, id: user
        expect(assigns(:user)).to eq user
      end

      it 'renders the :edit templates' do
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before do
        patch :update, id: user.id,
        user: attributes_for(:user, nickname: 'updated')
      end
      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'changes user attributes' do
        user.reload
        expect(user.nickname).to eq 'updated'
      end

      it 'redirects root_path' do
        expect(response).to redirect_to user_path
      end

      it 'sends flash messages' do
        expect(flash[:notice]).to eq "ユーザー情報が更新されました。"
      end
    end
  end

  context 'without User' do
    let(:user){ create(:user) }
    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, id: user,
        user: attributes_for(:user, nickname: 'Can I update me?')
        user.reload
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
