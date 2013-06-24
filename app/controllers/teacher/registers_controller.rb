class Teacher::RegistersController < Teacher::TeacherController
  add_breadcrumb "Wszystkie dzienniki", :teacher_registers_url

  def index
    @registers = current_user.divisions.page(params[:page])
  
    respond_to do |format|
      format.html 
    end
  end

  def subjects
    @division = current_user.divisions.find(params[:id])
    @subjects = @division.subjects.where("id IN (?)", current_user.subjects.map(&:id)).page(params[:page])
    
    add_breadcrumb "Dziennik lekcyjny klasy #{@division.name}", subjects_teacher_register_path(@division)
  end

  def students
    @division = current_user.divisions.find(params[:id])
    @subject = current_user.subjects.find(params[:subject_id])
    @students = @division.students.page(params[:page])

    add_breadcrumb "Dziennik lekcyjny klasy #{@division.name}", subjects_teacher_register_path(@division)
    add_breadcrumb @subject.name, students_teacher_register_path(@division, :subject_id => @subject.id)
  end
end