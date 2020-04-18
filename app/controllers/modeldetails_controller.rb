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
    @users = User.order(sort_column + " " + sort_direction).where("user_name LIKE ?","%#{params[:search]}%")
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

  def project_new
    @project = Project.new
  end

  def project_create
    @project = Project.new(project_params)
    if @project.save 
      redirect_to  projectdetails_admins_path(@project), notice: 'Project was successfully Created'
    else
      render 'project_new'
    end
  end

  def project_edit
    @project = Project.find(params[:id])
  end

  def project_update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projectdetails_admins_path(@project), notice: 'Project was successfully Updated'
    else
      render 'project_edit'
    end
  end

  def project_destroy
    @project = Project.find(params[:id])
    @project.destroy 
    redirect_to projects_admins_path, notice: 'Project was successfully deleted.'
  end

  def project_details
    @project = Project.find(params[:id])
  end

  
  def tasks
    @tasks = Task.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html 
      format.csv { send_data @tasks.to_csv }
    end
  end

  def task_new
    @task = Task.new
  end

  def task_create
    @task= Task.new(task_params)
    if @task.save
      redirect_to ad_task_show_path(@task), notice: 'Task was successfully Created'
    else
      render 'new'
    end
  end

  def task_edit
    @task = Task.find(params[:id])
  end

  def task_update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to ad_task_show_path(@task), notice: 'Task was successfully Updated'
    else
      render 'edit'
    end
  end

  def task_show
    @task = Task.find(params[:id])
  end

  def task_destroy
    @task = Task.find(params[:id])
    @task.destroy 
    redirect_to tasks_admins_path, notice: 'Task was successfully deleted.'
  end

  def admin_new
    @admin = Admin.new
  end

  def admin_create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to  ad_admin_show_path(@admin), notice: 'Admin was successfully Updated'
    else
      render 'admin_new'
    end
  end

  def admin_edit
    @admin = Admin.find(params[:id])
  end

  def admin_update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to  ad_admin_show_path(@admin), notice: 'Admin was successfully Updated'
    else
      render 'admin_edit'
    end
  end

  def admin_destroy
    @admin = Admin.find(params[:id])
    @admin.destroy 
    redirect_to details_admins_path, notice: 'Admin was successfully deleted.'    
  end

  def admin_show
    @admin = Admin.find(params[:id])
  end

  def user_new
    @user = User.new
  end

  def user_create
    @user = User.new(user_params)
    if @user.save
      redirect_to ad_user_show_path(@user), notice: 'confirmation mail has been send to created user'
    else
      render 'user_new'
    end
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def user_update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to ad_user_show_path(@user), notice: 'User was successfully Updated'
    else
      render 'user_edit'
    end
  end

  def user_show
    @user = User.find(params[:id])
  end

  def user_destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_admins_path, notice: 'User was successfully deleted.'
  end

  private 

  def sort_column
    params[:sort] || "id"
  end

  def sort_direction
    params[:direction] || "asc"
  end

  def project_params
    params.require(:project).permit(:user_id, :project_name, :organisation_id)
  end

  def task_params
    params.require(:task).permit(:task_name, :project_id, :user_id, :attachment)
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :organisation_id)
  end

end
