class CommentVotesController < ApplicationController
  def create
    @comment_vote = CommentVote.new(params[:comment_vote])

    @comment_vote.save!
    redirect_to post_url(@comment_vote.comment.post)
  end
end