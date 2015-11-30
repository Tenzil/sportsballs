class UserPostController < ApplicationController
  def index
    @user_posts = User.includes(:posts).all
  end
end
