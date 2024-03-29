class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  # before_action :require_same_user, only: [:edit, :update, :destroy]
  # before_action :require_admin, only: [:destroy]
  before_action :current_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.username}, you have Signed Up Succesfully !"
      redirect_to user_path(@user)
    else
      render 'new', status: 422
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit', status: 422
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 6)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.admin? || current_user.id == @user.id
      @user.destroy
      session.delete(:user_id)
      flash[:info] = "User and all articles created by user have been deleted (with Admin's Superpowers) !"
      render "index", status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user.nil? || (current_user != @user && !current_user.admin?)
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end


  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end

end
