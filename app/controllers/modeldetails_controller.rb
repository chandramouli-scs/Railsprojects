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
    respond_to do |format|
      format.html 
      format.csv { send_data @users.to_csv }
    end
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
    respond_to do |format|
      format.html 
      format.csv { send_data @projects.to_csv }
    end
    
  end

  def project_show
    @proj = Project.find(params[:id])
  end

  def tasks
    @tasks = Task.all
    respond_to do |format|
      format.html 
      format.csv { send_data @tasks.to_csv }
    end
  end
end
