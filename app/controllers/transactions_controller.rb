class TransactionsController < ApplicationController
	
	def transactions_user
		@user = User.find(params[:id])
	end
	def transactions_user_for
		@user = current_user.id
	end
end