class DashboardController < ApplicationController

 #authenticate user	
 before_action :authenticate_user!
 
  def projectsdash
  end

  def tasksdash
  end
end
