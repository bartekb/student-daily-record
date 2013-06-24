class Folder < ActiveRecord::Base
  attr_accessible :name
  has_many :messages
  belongs_to :user

  validates_presence_of :name

  def unread
    messages.where(:is_read => false)
  end
end