class Grade < ActiveRecord::Base
  attr_accessible :value, :description, :is_semester, :weight_id
  belongs_to :user
  belongs_to :student
  belongs_to :subject
  belongs_to :weight

  validates_presence_of :value
  validates :value, :inclusion => { :in => %w(1 1+ 2 2- 2+ 3 3- 3+ 4 4- 4+ 5 5+ 5- 6 6-), :message => "ocena %{value} nie jest prawidlowa" }

  default_scope order('created_at ASC')
end