class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :users

  def fullname
    return "Rodzice" if name == "getter"
    return "Nauczyciele" if name == "teacher"
    return "Inni"
  end
end
