class ModeldetailsController < ApplicationController
  before_action :authenticate_admin!
  def admins
    @admins = Admin.all
  end

  def users
    @users = User.all
  end

  def organisations
    @organisations = Organisation.all
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
