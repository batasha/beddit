class PostVotesController < ApplicationController
  def create
    @post_vote = PostVote.new(params[:post_vote])
    # @post_vote.user_id = current_user.id
    @post_vote.save!
    redirect_to post_url(@post_vote.post)
  end
end