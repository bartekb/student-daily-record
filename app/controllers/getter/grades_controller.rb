class Getter::GradesController < Getter::GetterController
  add_breadcrumb "Oceny", :getter_grades_url

  def index
    @subjects = current_user.student.division.subjects
  
    respond_to do |format|
      format.html 
    end
  end
end