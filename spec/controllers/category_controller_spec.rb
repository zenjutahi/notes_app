require_relative "../spec_helper"

RSpec.describe CategoriesController, type: :controller do
    describe 'Category #add_category_page' do
        context 'when add category button is clicked' do
            before :each do
                get '/categories/add'
            end
            it 'loads add category page successfully' do
                expect(last_response.body).to include('Add Notes categorie')
            end
        end
    end

    describe 'Category #add_category_page' do
        context 'when add category button is clicked' do
            before :each do
                get '/categories/add'
            end
            it 'loads add category page successfully' do
                expect(last_response.body).to include('Add Notes categorie')
            end
        end
    end
end
