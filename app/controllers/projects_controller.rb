class ProjectsController < ApplicationController
  #authenticate user
	before_action :authenticate_user!
  def new
  	@project = current_user.projects.build
  	@user = current_user
  end

  def create
  	@project = current_user.projects.build(project_params)
  	if  @project.save
  		redirect_to project_path(@project), notice: 'Project was successfully created.'
  	else
  		render 'new'
      #redirect_to dashboard_home_path
  	end
  end

  def edit
  	@project = current_user.projects.find(params[:id])
  	@user = current_user
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Project was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
  	@project = current_user.projects.find(params[:id])
  end

  def destroy
     @project = current_user.projects.find(params[:id])
     @project.destroy 
    redirect_to dashboard_projectsdash_path, notice: 'Project was successfully deleted.'
  end

  private 

  def project_params
  	params.require(:project).permit(:project_name, :user_id, :organisation_id)
  	#params.permit(:project_name, :user_id)
  end

end
