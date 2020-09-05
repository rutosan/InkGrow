class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @post = @comment.post
    if @comment.save
      flash[:notice] = 'コメントが送信されました'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = 'コメントの投稿に失敗しました。コメントが入力されていないまたは50文字以上入力されています。'
      
      redirect_back(fallback_location: root_path)
    end
 end

    def destroy
      @comment = Comment.find_by(id: params[:post_id])
      @comment.destroy
      flash[:notice]  = 'コメントを削除しました。'
      redirect_back(fallback_location: root_path)
    end  


  private
  def comment_params
    params.require(:comment).permit(:comment)
  end


end