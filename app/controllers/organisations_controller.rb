class OrganisationsController < ApplicationController
	before_action :authenticate_admin!
 
  def edit
    @organisation = Organisation.find(params[:id])
    @orgs = Organisation.all
    
  end

  def new
    authorize! :new, @organisation
  	@organisation = Organisation.new
  end

  def create 
  	@organisation = Organisation.create(organisation_params)
  	if @organisation.save
  		redirect_to organisationdetails_admins_path(@organisation), notice: 'Organisation was successfully Created.'
  	else
  		render 'new'
  	end
  end

  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update(organisation_params)
      redirect_to organisationdetails_admins_path(@organisation), notice: 'Organisation was successfully Updated'
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @organisation
    @organisation = Organisation.find(params[:id])
    @organisation.destroy 
    redirect_to organisations_admins_path, notice: 'Organisation was successfully Deleted.' 
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def organisation_details
    @organisation = Organisation.find(params[:id])
  end

  private

  def organisation_params
  	params.require(:organisation).permit(:organisation_name)
  end

end
