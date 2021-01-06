class RelationshipsController < ApplicationController
  
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end
  
  def destroy
    user = User.find(params[:user_id])
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    relationship.destroy
    redirect_to request.referer
  end
  
end
