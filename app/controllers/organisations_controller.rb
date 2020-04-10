class OrganisationsController < ApplicationController
	before_action :authenticate_admin!
 
  def edit
    @organisation = Organisation.find(params[:id])
    @orgs = Organisation.all
    
  end

  def new
  	@organisation = Organisation.new
    @orgs = Organisation.all
  end

  def create 
  	@organisation = Organisation.create(organisation_params)
  	if @organisation.save
  		redirect_to admindashboard_home_path
  	else
  		render 'new'
  	end
  end

  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update(organisation_params)
      redirect_to organisation_path
    else
      render 'edit'
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy 
    redirect_to organisations_admins_path, notice: 'User was successfully deleted.' 
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  private

  def organisation_params
  	params.require(:organisation).permit(:organisation_name)
  end

end
