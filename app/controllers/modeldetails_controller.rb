class ModeldetailsController < ApplicationController
  before_action :authenticate_admin!
  def admins
    @admins = Admin.all
    respond_to do |format|
      format.html 
      format.csv { send_data @admins.to_csv }
    end
  end

  def users
    @users = User.all
  end

  def organisations
    @organisations = Organisation.all
    respond_to do |format|
      format.html 
      format.csv { send_data @organisations.to_csv }
    end
  end

  def projects
    @projects = Project.all
    
  end

  def project_show
    @proj = Project.find(params[:id])
  end

  def tasks
    @tasks = Task.all
  end
end
