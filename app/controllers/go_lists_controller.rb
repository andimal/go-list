class GoListsController < ApplicationController
  def show
  	if user_signed_in?
  		@user = User.find( current_user.id )
  	end
  	
  	render action: :show
  end
end
