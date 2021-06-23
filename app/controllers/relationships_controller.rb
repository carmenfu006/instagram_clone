class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:following_id])
    current_user.active_relationships.create(following_id: user.id)
    redirect_to user_path(user)
  end

  def destroy
    relationship = Relationship.find(params[:id])
    user = relationship.following
    #  user which current_user follows
    relationship.destroy
    redirect_to user_path(user)
  end
end
