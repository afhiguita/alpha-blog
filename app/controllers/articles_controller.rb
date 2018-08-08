class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article updated sucessfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy(article_params)
      flash[:notice] = "The record was deleted sucessfully"
      redirect_to articles_path
    else
      flash[:notice] = "Was not possible delete the record, pls try again."
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end