class UsersController < ApplicationController
  before_filter :authenticate_user!, :config_twitter
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @twitter_user = $client.user

    @followers_count = @twitter_user.followers_count

    @friends_count = @twitter_user.friends_count

    @statuses_count = @twitter_user.statuses_count

    # @trends = $client.trends_available

    @profile_image = @twitter_user.profile_image_url

  end

  def new_tweet
  	$client.update("test tweet")
  end




end
