class HomeController < ApplicationController
  def index
  	if current_user
  		redirect_to dashboard_home_path
  	end
  	if current_admin
  		redirect_to admindashboard_home_path
  	end
  end
  def dashboard
  	#@project = current_user.projects.find(params[:id])
  end

  def admindashboard
    
  end
end
