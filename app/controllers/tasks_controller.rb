class TasksController < ApplicationController
	before_action :authenticate_user!
  def edit
  end

  def new
  	@task = current_user.tasks.build
  	@user = current_user
  end

  def create 
  	@task = current_user.tasks.build(task_params)
  	if  @task.save
  		redirect_to dashboard_home_path
  	else
  		render 'new'
  	end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
    @user = current_user
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end
  
  private

  def task_params
  	params.require(:task).permit(:task_name, :project_id, :user_id, :attachment)
  end

end
