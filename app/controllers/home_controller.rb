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
  end

  def admindashboard
    
  end
end
