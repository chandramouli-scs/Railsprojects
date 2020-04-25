class NewsfeedsController < ApplicationController
  	before_action :authenticate_user!

  def index
  	@newsfeeds = Newsfeed.all.order(created_at: :desc)
  end

  def show
  	@newsfeed = Newsfeed.find(params[:id])
  	authorize! :show, @newsfeed
  end

  def edit
  	@newsfeed = Newsfeed.find(params[:id])
  	@user = current_user
  	authorize! :edit, @newsfeed
  end

  def update
  	@newsfeed = Newsfeed.find(params[:id])
  	@user = current_user
  	authorize! :update, @newsfeed
    if @newsfeed.update(news_feed_params)
      redirect_to newsfeeds_path, notice: 'News was successfully Updated.'
    else
      render 'edit'
    end
  end  

  def new
  	@newsfeed = current_user.newsfeeds.new
  	@user = current_user
  end

  def create
  	@newsfeed = current_user.newsfeeds.build(news_feed_params)
  	if @newsfeed.save
  		redirect_to newsfeeds_path, notice: 'News was successfully Created.'
  	else
  		render 'new'
  	end

  end

  def destroy
  	@newsfeed = Newsfeed.find(params[:id])
  	authorize! :destroy, @newsfeed
     @newsfeed.destroy 
    redirect_to newsfeeds_path, notice: 'Newsfeed was successfully deleted.'
  end

  private

  def news_feed_params
  	params.require(:newsfeed).permit(:post, :user_id)
  end

end
