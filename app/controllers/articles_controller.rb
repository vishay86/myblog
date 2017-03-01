class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
      redirect_to articles_path
  end

  def update
     if @article.update(article_params)
        redirect_to articles_path
      else
        render 'edit'
      end
  end

  def destroy
    @article.delete
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find_by(params[:id])
  end

end