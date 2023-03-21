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
  end

  def edit
  end

  def update
    if params[:image_id].present?
      image = post.images&find(image_id)
      image.purge
    end
    if @post.update(posts_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to action: :index
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
