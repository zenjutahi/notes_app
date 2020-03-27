require_relative '../spec_helper.rb'

RSpec.describe 'The Login process', type: :feature, js: true do
    describe 'User #login' do
        before :each do
            visit '/users/login'
        end

        context 'when expected fields are present' do
            it 'loads the register page successfully' do
                expect(page).to have_field('Email')
                expect(page).to have_field('Password')
            end
        end

        context 'when some provided details are incorrect' do
            it 'does not login a user' do
                fill_in 'email', with: 'exaom'
                fill_in 'password', with: 'example23'
                click_button 'Login'
                expect(current_path).to eq '/users/login'
            end
        end
    end
end
