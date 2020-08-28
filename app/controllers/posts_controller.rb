class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show destroy]


  def index
    @posts = Post.page(params[:page]).per(15)
  end



  def new
    @post = Post.new(flash[:board])
  end


  
  def create
    @post = Post.new(post_params)

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
    @post = Post.find(params[:id])
  end


  def destroy
    post = Post.find(params[:id])
    post.delete

    redirect_to posts_path
  end
    

  def set_target_post
    @post = Post.find(params[:id])
  end



  private

    # paramsから欲しいデータのみ抽出
    def post_params
        params.require(:post).permit(:name, :title, :content)
    end

    
    
end