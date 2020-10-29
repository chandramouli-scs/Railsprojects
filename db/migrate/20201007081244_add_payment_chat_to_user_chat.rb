class AddPaymentChatToUserChat < ActiveRecord::Migration[6.0]
  def change
  	add_column :payment_chats, :user_id, :integer
  	add_column :payment_chats, :merchant_id, :integer
  end
end
