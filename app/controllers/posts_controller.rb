class PostsController < ApplicationController

  before_action :set_post, only: [:show, :update, :edit]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "post was saved"
      redirect_to posts_path
    else
      flash.now[:danger] = "There was a problem and the post was not saved"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(@post_params)
      flash[:success] = "post was saved"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "There was a problem and the post was not saved"
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :bootsy_image_gallery_id)
  end

end