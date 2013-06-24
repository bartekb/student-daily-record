class School < ActiveRecord::Base
  attr_accessible :name, :domain
  has_many :users
  has_many :subjects
  has_many :divisions
  has_many :students
  has_many :weights
end
