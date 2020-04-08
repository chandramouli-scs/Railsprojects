class RegistrationsController < Devise::RegistrationsController
	private

	def sign_up_params
		params.require(:user).permit(:user_name, :first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :organisation_id)
	end
end
