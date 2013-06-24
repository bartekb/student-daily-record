class Division < ActiveRecord::Base
  attr_accessible :name, :user_ids, :user_id, :subject_ids
  belongs_to :school
  belongs_to :user
  has_and_belongs_to_many :users
  has_and_belongs_to_many :subjects
  has_many :students

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :school_id
  validates_presence_of :user_id

  default_scope order('name ASC')

  def access_list
    access_data = []
    students.each do |student|
      access_data << "Uczen: #{student.name} login: #{student.user.username} haslo: #{student.user.access_token}" 
    end
    access_data.join("\n")    
  end
end