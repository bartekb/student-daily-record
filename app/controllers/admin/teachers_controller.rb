class Admin::TeachersController < Admin::AdminController
  def index
    @teacher = @school.users.build(params[:user])
    @teachers = @school.users.teachers.page(params[:page])
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teachers }
    end
  end

  def create
    @teacher = @school.users.build(params[:user])
    @teacher.role = Role.find_by_name "teacher"

    respond_to do |format|
      if @teacher.save
        flash[:notice] = "Nowy nauczyciel zostal dodany poprawnie."
        format.html { redirect_to admin_teachers_url }
        format.json { render :json => @teacher, :status => :created, :location => @teacher }
        format.js
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    @teacher = User.find(params[:id])
  end

  def update
    @teacher = User.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:user])
        flash[:notice] = "Dane nauczyciela zostaly zmienione."
        format.html { redirect_to admin_teachers_url }
        format.json { render :json => @teacher, :status => :created, :location => @teacher }
        format.js
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @teacher = User.find(params[:id])

    respond_to do |format|
      if @teacher.destroy
        flash[:notice] = "Nauczyciel zostal usuniety."
      else
        flash[:error] = "Nauczyciel nie zostal usuniety. Dzwon do kogos kto wie co jest grane!"
      end

      format.html { redirect_to admin_teachers_url }
    end
  end
end