class ApplicationController < ActionController::Base

		#this code is used to select admin as user in ablity used for roles
		def current_ability
		  if admin_signed_in?
		    @current_ability ||= Ability.new(current_admin)
		  else
		    @current_ability ||= Ability.new(current_user)
		  end
		end
end
