class PaymentChat < ApplicationRecord
  belongs_to :user, optional: true, :class_name => "UserChat"
  belongs_to :merchant, :class_name => "UserChat"
end
