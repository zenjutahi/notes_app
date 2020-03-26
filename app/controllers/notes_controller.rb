class NotesController < ApplicationController

  get "/category/:id/notes" do
    @category_id = params[:id]
    erb :"/notes/add_note"
  end

  post "/category/:id/notes/add" do
    recipe = Note.new(params)
    recipe[:category_id] = params[:id]
    if recipe.save
      redirect "/categories/#{params[:id]}/notes"
    else
      erb :"/categories/add_category"
    end
    redirect "/notes"
  end
end
