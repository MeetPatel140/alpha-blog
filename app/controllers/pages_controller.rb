class PagesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def home                    #Entire Web-App's Landing Page (Home Page)
  end

  def blogs                   #To Display All Blogs on One Page
    @articles = Article.all
  end

  def show                    #To Display any One Individual Blog Saperately (by it's ID only)
  end

  def new                     #To Create New Blog
    @article = Article.new
  end

  def create                  #Sub-Part of New Method (for creating & saving blog in Database)
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit                    #To Edit any One Individual Blog
  end

  def update                  #Sub-Part of Edit Method (for updating & saving blog in Database)
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy                 #To Delete Any one Individual Blog from the Database
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def article_params          #To get all the parameters which are to be passed while Creating or Updating a Blog
    params.require(:article).permit(:title, :description)
  end

  def set_article             #To Set the Current User's Article being used in Current action (CRUD)
    @article = Article.find(params[:id])
  end

end
