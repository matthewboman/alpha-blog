class ArticlesController < ApplicationController
  before_action :set_article, only: [
    :edit,
    :update,
    :show,
    :destroy
  ]

  # Get
  def index
    @articles = Article.all
  end

  def edit
  end

  def new
    @article = Article.new
  end

  def show
  end


  # Post
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else # e.g. validations fail
      render 'new'
    end
  end


  # Put/Patch
  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else # e.g. validations fail
      render 'edit'
    end
  end


  # Delete
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
