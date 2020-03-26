require_relative "../spec_helper"

RSpec.describe UsersController, type: :controller do
    let(:user_details) { attributes_for :user}

    describe 'User #Register_link' do
        context 'when register link is clicked' do
            before { get '/users/register' }

            it 'loads registration page successfully' do
                expect(last_response.body).to include('Register')
            end
        end
    end

    describe 'get /users/login' do
        context 'when login link is clicked' do
            before { get '/users/login' }

            it 'loads login page successfully' do
                expect(last_response.body).to include('Login')
            end
        end
    end

    describe 'User #Login' do
    let!(:user) { create :user, password: 'secret' }
    let!(:login_details) do
        { email: user.email, password: 'secret' }
    end

        context 'when login button is clicked' do
            before { post '/users/login', login_details }

            it 'login user' do
                expect(last_response).to be_redirect
                follow_redirect!
                expect(last_request.url).to eq 'http://example.org/home'
            end
        end
    end
end
