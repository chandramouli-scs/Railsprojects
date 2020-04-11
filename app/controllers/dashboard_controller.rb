class DashboardController < ApplicationController
	before_action :authenticate_user!
  def projectsdash
  end

  def tasksdash
  end
end
