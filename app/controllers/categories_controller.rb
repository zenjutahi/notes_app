class CategoriesController < ApplicationController
  use Rack::MethodOverride

  get "/categories/:id/notes" do
    @notes = category.notes
    erb :"/recipes/index"
  end

  get "/categories/add" do
    erb :"/categories/add_category"
  end

  post "/categories" do
    category = Category.new(params)
    category[:user_id] = session[:user_id]
    if category.save
      redirect "/home"
    else
      erb :"/categories/add_category"
    end
  end

  get "/categories/:id" do
    erb :"/categories/edit_category"
  end

  put "/categories/:id/edit" do
    category.update(params)
    redirect "/home"
  end

  delete "/categories/:id/delete" do
    category.destroy
    redirect "/home"
  end

  def category
    @category = Category.find(params[:id])
  end
end
