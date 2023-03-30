class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def index
    @posts = Post.order(updated_at: :desc)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    if params[:post][:image_ids]
        params[:post][:image_ids].each do |image_id|
        image = @post.images.find(image_id)
        image.purge
      end
    end
    if @post.update_attributes(posts_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private
  def posts_params
    params.require(:post).permit(:title, :article, :place, :link, :price, :person_id, images:[]).
    merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
