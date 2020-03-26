require_relative "../spec_helper"

RSpec.describe ApplicationController, type: :controller do
  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to My Recipes')
  end
end
