class Weight < ActiveRecord::Base
  attr_accessible :name
  has_many :grades
  belongs_to :school
end