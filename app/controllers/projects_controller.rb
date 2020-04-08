class ProjectsController < ApplicationController
	before_action :authenticate_user! # for knowing , only: [:edit, :show, :create]
  #before_action :authenticate_admin!, only: [:show]
  def new
  	@project = current_user.projects.build
  	@user = current_user
  end

  def create
  	@project = current_user.projects.build(project_params)
  	if  @project.save
  		redirect_to @project
  	else
  		render 'new'
      #redirect_to dashboard_home_path
  	end
  end

  def edit
  	@project = current_user.projects.find(params[:id])
  	@user = current_user
  end

  def show
  	@project = current_user.projects.find(params[:id])
  end

  private 

  def project_params
  	params.require(:project).permit(:project_name, :user_id, :organisation_id)
  	#params.permit(:project_name, :user_id)
  end

end
