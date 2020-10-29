class CreatePaymentChats < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_chats do |t|
    	t.string :amount
      t.timestamps
    end
  end
end
