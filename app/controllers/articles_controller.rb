class ArticlesController < ApplicationController

  # List all
  def index
    @articles = Article.all
  end

  # Shows info of individual article
  def show
    @article = Article.find(params[:id])
  end

  # Create a new article
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params(params))
    @article.save

    redirect_to article_path(@article)
  end

  # Update the article
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(articles_params(params))

    redirect_to article_path(@article)
  end

  # Delete the article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def articles_params(params)
    params.require(:article).permit(:title, :content)
  end

  # Optional: this creates a method to be executed before the action
  def set_article
  end
end
