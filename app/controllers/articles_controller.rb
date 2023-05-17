class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :destroy ]

  def index
    @articles=Article.all
    respond_to do |format|
      format.json { render json: @articles}
      format.html {render :index}
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @article}
      format.html {render :show}
    end
  end

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(article_params)
    @article.save
    MailerJob.perform(@article)
    # CreateNotificationMailer.create_notification(@article).
    #    deliver_later(wait_until: 1.minutes.from_now)
    respond_to do |format|
      format.html {redirect_to action:'index'}
      format.json {render json: @article}
    end
  end

  def destroy
    @article.destroy
    redirect_to action:'index'
  end

  private

  def article_params
    params.require(:article).permit(:title,:date,:content,:source,:image)
  end
  def set_article
    if params[:id].to_i == 0
    @article=Article.find_by(slug:params[:id])
    else
      @article=Article.find(params[:id])
    end
  end
end
