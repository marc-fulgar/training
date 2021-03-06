class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :edit, :update, :destroy ]
  
  def index
    @post = Post.new
    @posts = Post.all.paginate(page: params[:page], per_page: 15).order(created_at: :desc).includes(user: :department)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    # @post = Post.new(post_params)
    # @post.user_id = current_user
    
    @user = current_user
    @post = @user.posts.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post successfully added.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to posts_path, notice: 'Post cannot be empty!' }
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  private  
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
