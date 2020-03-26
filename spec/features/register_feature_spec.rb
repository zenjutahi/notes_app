require_relative '../spec_helper.rb'

RSpec.describe 'The register process', type: :feature, js: true do
    describe 'User #register' do
        before :each do
            visit '/users/register'
        end

        context 'when expected fields are present' do
            it 'loads the register page successfully' do
                expect(page).to have_field('Email')
                expect(page).to have_field('Username')
                expect(page).to have_field('Password')
                expect(page).to have_field('Confirm Password')
            end
        end

        context 'when some provided details are incorrect' do
            it 'does not register a user or redirect user to login' do
                fill_in 'email', with: 'example@gmail.com'
                fill_in 'username', with: 'example'
                fill_in 'password', with: 'example123'
                fill_in 'password_confirmation', with: 'example'
                click_button 'Register'
                expect(current_path).to eq '/users/register'
            end
        end
    end
end
