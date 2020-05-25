class RolesController < ApplicationController

	def index 
	  @roles = Role.all
	  @admins = Admin.where(super_admin: false).order(id: :asc)
	end

	def new
		if current_admin.super_admin?
			@role = Role.new
		else
			redirect_to root_path
		end
	end

	def create
		@role = Role.create(role_params)
		if @role.save
			redirect_to roleindex_path,notice: "Role was succesfully created"
		else
			render 'new'
		end
	end

	def edit
		if current_admin.super_admin?
		@role = Role.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def update
		@role = Role.find(params[:id])
		if @role.update(role_params)
			redirect_to roleindex_path,notice: "Role and permissions was succesfully Updated"
		else
			render 'edit'
		end
	end

	def adminrolemanage_edit
		if current_admin.super_admin?
			@adminrole = Admin.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def adminrolemanage_update
		@adminrole = Admin.find(params[:id])
		if @adminrole.update(adminrole_params)
			redirect_to roleindex_path,notice: "Role was succesfully Updated"
		else
			render 'adminrole_edit'
		end
	end


	private

	def role_params
		params.require(:role).permit(:name, { permission_ids:[] })
	end

	def adminrole_params
		params.require(:admin).permit(:role_id)
	end


end