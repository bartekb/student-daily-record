class Admin::StudentsController < Admin::AdminController
  def index
    @student = @school.students.build(params[:student])
    @students = @school.students.page(params[:page])
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @students }
    end
  end

  def create
    @student = @school.students.build(params[:student])

    respond_to do |format|
      if @student.save
        flash[:notice] = "Nowy uczen zostal dodany poprawnie."
        format.html { redirect_to admin_students_url }
        format.json { render :json => @student, :status => :created, :location => @student }
        format.js
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    @student = @school.students.find(params[:id])
  end

  def update
    @student = @school.students.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = "Dane ucznia zostaly zmienione."
        format.html { redirect_to admin_students_url }
        format.json { render :json => @student, :status => :created, :location => @student }
        format.js
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @student = @school.students.find(params[:id])

    respond_to do |format|
      if @student.destroy
        flash[:notice] = "Uczen zostal usuniety."
      else
        flash[:error] = "Uczen nie zostal usuniety. Dzwon do kogos kto wie co jest grane!"
      end

      format.html { redirect_to admin_students_url }
    end
  end
end