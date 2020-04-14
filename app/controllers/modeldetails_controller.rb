class ModeldetailsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_admin!
  def admins
    @admins = Admin.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html 
      format.csv { send_data @admins.to_csv }
    end
  end

  def users
    @users = User.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html 
      format.csv { send_data @users.to_csv }
    end
  end

  def organisations
    @organisations = Organisation.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html 
      format.csv { send_data @organisations.to_csv }
    end
  end

  def projects
    @projects = Project.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html 
      format.csv { send_data @projects.to_csv }
    end
    
  end

  def project_show
    @proj = Project.find(params[:id])
  end

  def tasks
    @tasks = Task.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html 
      format.csv { send_data @tasks.to_csv }
    end
  end

  private 

  def sort_column
    params[:sort] || "id"
  end

  def sort_direction
    params[:direction] || "asc"
  end

end
