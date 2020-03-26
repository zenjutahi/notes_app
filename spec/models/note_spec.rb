require_relative '../spec_helper.rb'

RSpec.describe Note, type: :model do
    describe 'Note model' do
        context 'associations' do
            it { should belong_to(:category) }
        end

        context 'validates presence of fields' do
            it do
                should validate_presence_of(:name).
                with_message('is a required field')
            end
            it do
                should validate_presence_of(:description).
                with_message('is a required field')
            end
        end

        context 'validates inputs length' do
            it do
                should validate_length_of(:name).
                is_at_least(3).is_at_most(20).
                with_message('is either too short or too long')
            end
            it do
                should validate_length_of(:description).
                is_at_least(10).
                with_message('is too short')
            end
        end

        context 'validates uniqueness' do
            it do
                should validate_uniqueness_of(:name).case_insensitive.
                with_message('has already been taken')
            end
        end
    end
end
