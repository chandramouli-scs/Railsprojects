class ApplicationController < ActionController::Base

	
	  #load the permissions for the current user so that UI can be manipulated
	  def load_permissions
	    @admin_permissions = can? current_admin.role.permissions.collect{|i| [i.subject_class.to_sym]}, @admin
	    @edit_permissions = current_admin.role.permissions.collect{|i| [i.subject_class, i.action]}.include?(['task_edit', 'all']) 
	  end

		def current_ability
		  if admin_signed_in?
		    @current_ability ||= Ability.new(current_admin)
		  else
		    @current_ability ||= Ability.new(current_user)
		  end
		end
end
