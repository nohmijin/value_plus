class ScrapsController < ApplicationController
    def scrap_toggle
    @scrap = Scrap.find_by(user_id: current_user.id, assembly_id: params[:assembly_id])
    
    if @scrap.nil?
      @scrap = Scrap.create(user_id: current_user.id, assembly_id: params[:assembly_id])   
    else
      @scrap.destroy
 
    end
    
    redirect_to :back
    end
end
