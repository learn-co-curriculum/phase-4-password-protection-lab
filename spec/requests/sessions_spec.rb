require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { User.create(username: 'steven', password: 'un1verse') }

  describe "POST /login" do
    context 'with valid username and password' do
      it 'returns the logged in user' do
        post "/login", params: { username: user.username, password: user.password }

        expect(response.body).to include_json({ 
          id: user.id, username: user.username
        })
      end

      it 'sets the user ID in the session' do
        post "/login", params: { username: user.username, password: user.password }

        expect(session[:user_id]).to eq(user.id)
      end
    end

    context 'with invalid password' do
      it 'returns a 401 unauthorized response' do
        post "/login", params: { username: user.username, password: '123' }

        expect(response).to have_http_status(:unauthorized)
      end

      it 'does not set the user ID in the session' do
        post "/login", params: { username: user.username, password: '123' }

        expect(session[:user_id]).to eq(nil)
      end
    end

    context 'with invalid username' do
      it 'returns a 401 unauthorized response' do
        post "/login", params: { username: 'nobody', password: '123' }

        expect(response).to have_http_status(:unauthorized)
      end

      it 'does not set the user ID in the session' do
        post "/login", params: { username: 'nobody', password: '123' }

        expect(session[:user_id]).to eq(nil)
      end
    end

  end
  
  describe "DELETE /logout" do
    before do
      post "/login", params: { username: user.username, password: user.password }
    end

    it 'returns no content' do
      delete "/logout"

      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the user ID from the session' do
      delete "/logout"

      expect(session[:user_id]).to eq(nil)
    end
  end

end
