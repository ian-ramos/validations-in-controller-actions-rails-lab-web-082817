class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post.update(post_params) #update checks if parameters are valid.  If it isn't then it won't save and it will return false
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :"posts/edit"
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
