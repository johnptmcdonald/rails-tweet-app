class UsersController < ApplicationController
  before_filter :authenticate_user!, :config_twitter
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @followers = $client.followers

    @timeline_tweets = $client.user_timeline

    @trends = $client.trends_available

  end

  def new_tweet
  	$client.update("test tweet")
  end




end
