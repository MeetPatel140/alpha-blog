class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
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
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :frist_name, :last_name)
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
