class Message < ActiveRecord::Base
  attr_accessible :title, :body, :message_recipients, :recipient_names, :recipient_ids
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :folder
  has_many :message_recipients
  has_many :recipients, :class_name => "User", :through => :message_recipients

  validates_presence_of :title, :body, :sender
  validate :has_participants?

  after_create :put_into_folders

  def message_recipient_tokens=(ids)
    ids.each do |r|
      recipients << User.find(r) unless r.empty?
    end
  end

  def set_recipient_names
    names = []
    recipients.each do |r|
      names << r.fullname
    end

    self.recipient_names = names.join(", ")
  end

  def is_in?(folder_name)
    folder == folder.user.folders.find_by_name(folder_name)
  end

  private

  def has_participants?
    errors[:recipient_ids] << "brak adresatow" if self.recipients.blank? && folder.name == "sent"
  end

  def put_into_folders
    if folder.name == "sent"
      recipients.each do |r|
        new_msg = self.dup
        new_msg.folder = r.received_folder
        new_msg.save!
      end
    end
  end
end