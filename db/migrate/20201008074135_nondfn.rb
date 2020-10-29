class Nondfn < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :payment_chats, :user_id, true
  end
end
