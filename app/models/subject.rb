class Subject < ActiveRecord::Base
  attr_accessible :name, :system_name, :user_ids, :division_ids
  belongs_to :school
  has_and_belongs_to_many :users
  has_and_belongs_to_many :divisions
  has_many :grades

  validates_presence_of :name
  validates_presence_of :system_name
  validates_uniqueness_of :system_name, :scope => :school_id

  default_scope order('name ASC')

  before_validation :set_system_name

  private

  def set_system_name
    self.system_name = self.name if self.system_name.blank? && self.name?
  end
end