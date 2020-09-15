class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comments = Comments.all
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    ActionCable.server.broadcast 'comment_channel', content: @comment if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :text, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
