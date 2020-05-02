class ApplicationController < ActionController::Base


	def current_ability
	  if admin_signed_in?
	    @current_ability ||= Ability.new(current_admin)
	  else
	    @current_ability ||= Ability.new(current_user)
	  end
	end
end
