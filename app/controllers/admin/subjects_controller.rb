class Admin::SubjectsController < Admin::AdminController
  def index
    @subject = @school.subjects.build(params[:subject])
    @subjects = @school.subjects.page(params[:page])
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subjects }
    end
  end

  def create
    @subject = @school.subjects.build(params[:subject])

    respond_to do |format|
      if @subject.save
        flash[:notice] = "Nowy przedmiot zostal dodany poprawnie."
        format.html { redirect_to admin_subjects_url }
        format.json { render :json => @subject, :status => :created, :location => @subject }
        format.js
      else
        format.html { render :action => "new" }
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    @subject = @school.subjects.find(params[:id])
  end

  def update
    @subject = @school.subjects.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        flash[:notice] = "Dane przedmiotu zostaly zmienione."
        format.html { redirect_to admin_subjects_url }
        format.json { render :json => @subject, :status => :created, :location => @subject }
        format.js
      else
        format.html { render :action => "edit" }
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @subject = @school.subjects.find(params[:id])

    respond_to do |format|
      if @subject.destroy
        flash[:notice] = "Przedmiot zostal usuniety."
      else
        flash[:error] = "Przedmiot nie zostal usuniety. Dzwon do kogos kto wie co jest grane!"
      end

      format.html { redirect_to admin_subjects_url }
    end
  end
end