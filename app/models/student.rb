class Student < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :division_id
  belongs_to :school
  belongs_to :division
  belongs_to :user, :dependent => :destroy
  has_many :grades, :dependent => :destroy

  validates_presence_of :firstname, :lastname, :division_id

  default_scope order('lastname, firstname ASC')

  after_create :create_user_access

  def name
    "#{firstname} #{lastname}"
  end

  private

  def create_user_access
    pass = SecureRandom.hex(4)
    new_user = User.new(
      :username => "uczen#{id.to_s}", 
      :password => pass, 
      :password_confirmation => pass, 
      :access_token => pass, 
      :fullname => "#{lastname} #{firstname}"
    )
    new_user.school = school
    new_user.save!
    self.user = new_user
    self.save!
  end
end