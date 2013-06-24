class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :request_keys => [:subdomain]

  attr_accessor :login

  attr_accessible :username, :email, :password, :password_confirmation, :reset_password_token, :current_password, :remember_me, :login, :fullname, :subject_ids, :division_ids, :access_token

  validates_presence_of :username
  validates_uniqueness_of :username, :scope => :school_id

  belongs_to :role
  belongs_to :school
  before_create :set_default_role
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :divisions
  has_one :division
  has_one :student
  has_many :grades
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :message_recipients
  has_many :messages, :class_name => 'Message', :through => :message_recipients, :primary_key => 'message_id'
  has_many :folders

  default_scope order('username ASC')
  scope :teachers, joins(:role).where("roles.name = ?", "teacher")
  scope :getters, joins(:role).where("roles.name = ?", "getter")

  after_create :create_folders

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    posted_login = conditions.delete(:login)
    school = School.find_by_domain(warden_conditions[:subdomain])
    
    if posted_login && school
      where(["username = ? AND school_id = ?", posted_login, school.id]).first
    # else
    #   where(conditions).first
    end
  end

  def welcome_name
    fullname || username
  end

  def roles
    [role]
  end

  def group_name
    role.name
  end

  def received_folder
    folders.find_by_name "received"
  end

  def sent_folder
    folders.find_by_name "sent"
  end

  def draft_folder
    folders.find_by_name "draft"
  end

  def removed_folder
    folders.find_by_name "removed"
  end

  def email_required?
    super && username.blank?
  end

  def is_admin?
    role.name == "admin"
  end

  def is_getter?
    role.name == "getter"
  end

  def is_teacher?
    role.name == "teacher"
  end

  def create_folders
    if folders.blank?
      folders.create!(:name => :received)
      folders.create!(:name => :sent)
      folders.create!(:name => :draft)
      folders.create!(:name => :removed)
    end
  end

  private
  
    def set_default_role
      self.role ||= Role.find_by_name('getter')
    end
end
