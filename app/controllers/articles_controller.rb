class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  def create
    # render plain:params[:article].inspect
    # @article =  Article.new(article_params)
    # @article.save # saving the article on the DB
    # redirect_to article_path(@article) # displaying the new data saved
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article) # displaying the new record saved
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end