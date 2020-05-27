class TransactionsController < ApplicationController
	def transactions_user
		@user = User.find(params[:id])
	end
end