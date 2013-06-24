class MessageRecipient < ActiveRecord::Base
  belongs_to :recipient, :class_name => "User", :foreign_key => "user_id"
  belongs_to :message
end