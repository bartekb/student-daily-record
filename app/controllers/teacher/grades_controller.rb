class Teacher::GradesController < Teacher::TeacherController
  
  def new
    @grade = Grade.new
    @student = Student.find(params[:s_id])
    @subject = Subject.find(params[:su_id])

    @grade.student = @student
    @grade.subject = @subject
    @grade.user = current_user
  end

  def create
    @grade = Grade.new(params[:grade])
    @student = Student.find(params[:s_id])
    @subject = Subject.find(params[:su_id])

    @grade.student = @student
    @grade.subject = @subject
    @grade.user = current_user

    respond_to do |format|
      if @grade.save
        flash[:notice] = "Nowa ocena zostala dodana poprawnie."
        format.html { redirect_to students_teacher_register_path(@grade.student.division, :subject_id => @grade.subject.id) }
        format.json { render :json => @grade, :status => :created, :location => @grade }
        format.js
      else
        format.html { render :action => "new" }
        format.json { render :json => @grade.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    @grade = Grade.find(params[:id])
    @student = @grade.student
  end

  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        flash[:notice] = "Dane oceny zostaly zmienione."
        format.html { redirect_to redirect_to students_teacher_register_path(@grade.student.division, :subject_id => @grade.subject.id) }
        format.json { render :json => @grade, :status => :created, :location => @grade }
        format.js
      else
        format.html { render :action => "edit" }
        format.json { render :json => @grade.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @division = @grade.student.division
    @subject = @grade.subject

    respond_to do |format|
      if @grade.destroy
        flash[:notice] = "Ocena zostala usunieta."
      else
        flash[:error] = "Ocena nie zostala usunieta. Dzwon do kogos kto wie co jest grane!"
      end

      format.html { redirect_to students_teacher_register_path(@division, :subject_id => @subject.id) }
    end
  end
end