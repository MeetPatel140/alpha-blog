class SignupsController < ApplicationController
  include BlogsHelper

  def new
    @user = User.new
  end

  def signup
    @user = User.new
    @user.email = params[:email]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.password = params[:password]
    @user.username = params[:username]
    @user.status = false

    if User.exists?(username: @user.username)
      flash[:error] = "Username is already registered. Please use a different username."
      # render :new
    elsif User.exists?(email: @user.email)
      flash[:error] = "Email is already registered. Please use a different email."
      # render :new
    elsif @user.save
      flash[:success] = "You have successfully signed up!"
      # redirect_to user_path(@user)
    else
      flash[:error] = "Error while signing up for your account. Please contact Admin for help!"
      puts @user.errors.full_messages
      # render :new
    end
  end

  private

  def signup_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
