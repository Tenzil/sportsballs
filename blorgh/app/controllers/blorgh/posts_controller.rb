require_dependency "blorgh/application_controller"

module Blorgh
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /posts
    def index
      @posts = Post.all
    end

    # GET /posts/1
    def show
    end

    # GET /posts/new
    def new
      @post = Post.new
      @post.user = current_user
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /posts/1
    def update
      puts @post.inspect
      @post.user = current_user
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :text, :user)
      end
  end
end
