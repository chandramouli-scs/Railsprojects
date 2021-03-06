class ModeldetailsController < ApplicationController
  
  #authenticate admin
  before_action :authenticate_admin!


  def admins
    @admins = Admin.all
    #params from form
    @admins1 = Admin.where(id: params[:admin_id])
    #export to csv
    respond_to do |format|
      format.html 
      attributes = %w{id email created_at}
      admin_csv =  CSV.generate do |csv|
          csv << attributes
          @admins1.each do |admin|
            csv << admin.attributes.values_at(*attributes)
          end
      end
      format.csv { send_data admin_csv }
      #export to pdf format 
      format.pdf {render template: 'modeldetails/admins1', pdf: 'admins1'}
    end
  end

  def users
    @users = User.all.order(id: "asc")
    #params from form
    @users1 = User.where(id: params[:user_id])
    #export to csv
    respond_to do |format|
      format.html 
      attributes = %w{id email first_name last_name phone_number user_name}
      user_csv =  CSV.generate do |csv|
          csv << attributes
          @users1.each do |user|
            csv << user.attributes.values_at(*attributes)
          end
      end
      format.csv { send_data user_csv }
      #export to pdf format 
      format.pdf {render template: 'modeldetails/users1', pdf: 'users1'}
    end
  end

  def newshift
    shift_key = params[:user_id]
    redirect_to users_admins_path
  end

  def organisations
    @organisations = Organisation.all
    #params from form
    @organisations1 = Organisation.where(id: params[:organisation_id])
    #export to csv
    respond_to do |format|
      format.html 
      attributes = %w{id organisation_name created_at}
      org_csv =  CSV.generate do |csv|
          csv << attributes
          @organisations1.each do |org|
            csv << org.attributes.values_at(*attributes)
          end
      end
      format.csv { send_data org_csv }
      #export to pdf format 
      format.pdf {render template: 'modeldetails/organisations1', pdf: 'organisations1'}
    end
  end

  def projects
    @projects = Project.all
    #params from form
    @projects1 = Project.where(id: params[:project_id])
    #export to csv
    respond_to do |format|
      format.html 
      attributes = %w{id project_name created_at}
      project_csv = CSV.generate do |csv|
        csv << attributes
        @projects1.each do |project|
          csv << project.attributes.values_at(*attributes)
        end
      end
      format.csv { send_data project_csv }
      #export to pdf format 
      format.pdf {render template: 'modeldetails/projects1', pdf: 'projects1'}
    end
    
  end

  def project_show
    @proj = Project.find(params[:id])
  end

  def project_new
    authorize! :project_new, @project
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
    authorize! :project_destroy, @project
    @project = Project.find(params[:id])
    @project.destroy 
    redirect_to projects_admins_path, notice: 'Project was successfully deleted.'
  end

  def project_details
    @project = Project.find(params[:id])
  end

  
  def tasks
    @tasks = Task.all
    #params from form
    @tasks1 = Task.where(id: params[:task_id])
    #export to csv
    respond_to do |format|
      format.html 
      attributes = %w{id task_name}
      task_csv =  CSV.generate do |csv|
          csv << attributes
          @tasks1.each do |task|
            csv << task.attributes.values_at(*attributes)
          end
      end
      format.csv { send_data task_csv }
      #export to pdf format 
      format.pdf {render template: 'modeldetails/tasks1', pdf: 'tasks1'}
    end
  end

  def task_new
    authorize! :task_new, @task
    @task = Task.new
  end

  def task_create
    @task= Task.new(task_params)
    if @task.save
      redirect_to ad_task_show_path(@task), notice: 'Task was successfully Created'
    else
      render 'task_new'
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
    authorize! :task_destroy, @task
    @task = Task.find(params[:id])
    @task.destroy 
    redirect_to tasks_admins_path, notice: 'Task was successfully deleted.'
  end

  def admin_new
    authorize! :admin_create, @admin
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
    authorize! :admin_destroy, @admin
    @admin = Admin.find(params[:id])
    @admin.destroy 
    redirect_to details_admins_path, notice: 'Admin was successfully deleted.'    
  end

  def admin_show
    @admin = Admin.find(params[:id])
  end

  def user_new
    authorize! :user_new, @user
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
    authorize! :user_destroy, @user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_admins_path, notice: 'User was successfully deleted.'
  end

  def adminroles

    if current_admin.role == "moderator" || current_admin.role == "admin" 
      redirect_to root_path
    else
      @admins1 = Admin.all.order(id: :asc)
    end

  end

  def adminrole_show
    if current_admin.super_admin?
      @admin = Admin.find(params[:id])
      @admins1 = Admin.all.order(id: :asc)
    else
      redirect_to root_path
    end
  end

  def adminrole_update
    @adminrole = Admin.find(params[:id])
    if @adminrole.update(adminrole_params)
      redirect_to adminroles_path
    else
      render 'adminrole_show'
  end
end

  def projectstatus
    @projects = Project.where(status: "pending")
  end 

  def projectstatus_edit
    @project = Project.find(params[:id])
  end

  def projectstatus_update
    @project = Project.find(params[:id])
    #params from form
    @status = params[:project][:status]
    @user = @project.user_id
    @wallet = Wallet.where(user_id: @user)
    @balance = @wallet.first.balance
    @proj_id = @project.id
    @length = @project.project_name.length
    #if condition for dynamic wallet credit to user
    if @length >= 10
      @approve = 50.6
    elsif @length >=5 && @length <=7
      @approve = 40.4
    else
      @approve = 20.7
    end
    @reject = 10
    #after update project approval a new transacation is created
    if @project.update(projectstatus_params)
        ActiveRecord::Base.transaction do
        if @status == "approve"
          Transaction.create(user_id: @user, coins: @approve, status: "approve", instance_bal: @balance, project_id: @proj_id)
          @wallet.update(balance: @balance + @approve)
        elsif @status == "reject"
          Transaction.create(user_id: @user, coins: @reject, status: "reject", instance_bal: @balance, project_id: @proj_id)
          @wallet.update(balance: @balance - @reject)
        end
      end
      redirect_to  projectstatus_path, notice: "Project status has been set successfully"
    else
      render 'projectstatus_edit'
    end
  end

  def projectstatus_reject
    @project = Project.where(status: "reject")
  end

  def projectstatus_reject_edit
    @project = Project.find(params[:id])
  end

  def projectstatus_reject_update
    # params from form 
    @project = Project.find(params[:id])
    @status = params[:project][:status]
    @commit = params[:commit]
    @user = @project.user_id
    @wallet = Wallet.where(user_id: @user)
    @balance = @wallet.first.balance
    @proj_id = @project.id
    @length = @project.project_name.length
    #if condition for dynamic wallet credit to user
    if @length >= 10
      @approve = 50.6
    elsif @length >=5 && @length <=7
      @approve = 40.4
    else
      @approve = 20.7
    end
    @reject = 10
    #after update of user project approval a new transaction is created 
    if @project.update(projectstatus_reject_params)
      ActiveRecord::Base.transaction do
        if @status == "approve"
          Transaction.create(user_id: @user, coins: @approve, status: "approve", instance_bal: @balance, project_id: @proj_id)
          @wallet.update(balance: @balance + @approve)
        elsif @status == "reject"
          Transaction.create(user_id: @user, coins: @reject, status: "reject", instance_bal: @balance, project_id: @proj_id)
          @wallet.update(balance: @balance - @reject)
        end
      end
      redirect_to  projectstatus_reject_path, notice: "Project status has been updated successfully"
    else
      render 'projectstatus_reject_edit'
    end
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
    params.require(:task).permit(:task_name, :project_id, :user_id, :photo, :cover)
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :organisation_id)
  end

  def adminrole_params
    params.require(:admin).permit(:role)
  end

  def projectstatus_params
    params.require(:project).permit(:status)
  end

  def projectstatus_reject_params
    params.require(:project).permit(:status)
  end

end
