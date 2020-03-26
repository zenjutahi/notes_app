require_relative '../spec_helper.rb'

RSpec.describe User, type: :model do
    describe 'User model' do
        context 'associations' do
            it { should have_many(:categories) }
        end
        context 'validates presence of fields' do
            it { should validate_presence_of(:email).
                with_message('is a required field') }

            it { should validate_presence_of(:username).
                with_message('is a required field') }
        end

        context 'has secure password' do
            it { should have_secure_password }
        end

        context 'password matches confirmation password' do
            it { should validate_confirmation_of(:password) }
        end

        context 'validates uniqueness' do
            let(:user) { create(:user) }

            it { should validate_uniqueness_of(:email).
                with_message('has already been taken') }
            it { should validate_uniqueness_of(:username).
                with_message('has already been taken') }
        end
    end
end
