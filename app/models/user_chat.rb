class UserChat < ApplicationRecord
	has_many :users, class_name: "PaymentChat", foreign_key: "user_id"
  has_many :merchants, class_name: "PaymentChat", foreign_key: "merchant_id"
end
