require './config/environment'

class ApplicationController < Sinatra::Base
  enable :sessions

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "ENV['secret_key']"
  end

  get "/" do
    erb :welcome
  end

end
