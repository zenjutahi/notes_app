require 'shoryuken'
require_relative '../../workers/register_mail_worker'

class UsersController < ApplicationController

  get "/users/register" do
    erb :"/users/register"
  end

  post "/users/register" do
    user = User.new(params)
    if user.save
      RegisterMailWorker.perform_async(user.id.to_s)
      redirect "/users/login"
    else
      erb :"/users/register"
    end
  end

  get "/users/login" do
    erb :"/users/login"
  end

  post '/users/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/home"
    else
      erb :"/users/login"
    end
  end

  get '/user/profile' do
    current_user
    erb :"/users/profile"
  end

  get '/home' do
    @categories = current_user.categories
    erb :"/home/index"
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end
end
