class OrganisationsController < ApplicationController
	before_action :authenticate_admin!
 
  def edit
  end

  def new
  	@organisation = Organisation.new
  end

  def create 
  	@organisation = Organisation.create(organisation_params)
  	if @organisation.save
  		redirect_to admindashboard_home_path
  	else
  		render 'new'
  	end
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  private

  def organisation_params
  	params.require(:organisation).permit(:organisation_name)
  end

end
