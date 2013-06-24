module ApplicationHelper
  def color_grade(grade)
    return "badge-important" unless grade.scan(/1/).blank?
    return ""                unless grade.scan(/2/).blank?
    return "badge-info"      unless grade.scan(/3/).blank?
    return "badge-warning"   unless grade.scan(/4/).blank?
    return "badge-success"   unless grade.scan(/5/).blank?
    return "badge-inverse"   unless grade.scan(/6/).blank? 
  end
end
