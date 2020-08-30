class PostsController < ApplicationController
  before_action :set_current_user_post, only: [:destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.page(params[:page]).per(15)

  end



  def new
    @post = current_user.posts.build
  end


  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "記事が投稿されました!"
      redirect_to posts_path
    else
      render :new, flash: {
          post: @post,
          error_messages: @post.errors.full_messages
        }
       end
    
  end

  def show
    @posts = Post.all
    @post = Post.find_by(id: params[:id])
    @post.user_id = @post.user_id
    @user = User.find_by(id: @post.user_id)
    @comments = @post.comments
    @comment = Comment.new
    
  end


  def destroy
    post = Post.find(params[:id])
    post.delete

    redirect_to posts_path
  end
    

  def set_current_user_post
    @post = current_user.posts.find(params[:id])
  end



  def ensure_correct_user
    @post = Post.find_by(id:params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end



  private

    # paramsから欲しいデータのみ抽出
    def post_params
        params.require(:post).permit(:title, :image, :tag_list, :user_id)
    end

    
    
end