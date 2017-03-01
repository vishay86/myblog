class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 2)
  end

  def show
  end

  def new
    @article = current_user.articles.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:success] = 'Article was successfully created'
      redirect_to articles_path
      
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
      
    end
  end

  def update
     if @article.update(article_params)
        flash[:success] = 'Article was successfully updated'
        redirect_to articles_path
       
      else
        flash[:danger] = 'Something went wrong'
        render 'edit'
        
      end
  end

  def destroy
    @article.delete
    flash[:success] = 'Article was successfully deleted'
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