class CommentsController < ApplicationController
  def index
    @comments = Comment.where(commentable_type: params[:commentable_type], commentable_id: params[:commentable_id])
    render json: @comments
  end
end