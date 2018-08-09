class LikesController < ApplicationController
  def like_toggle
    like = Like.find_by(user_id: current_user.id, assembly_id: params[:assembly_id])
    
    if like.nil?
      Like.create(user_id: current_user.id, assembly_id: params[:assembly_id])   
    else
      like.destroy
 
    end
    
    redirect_to :back
  end
end
