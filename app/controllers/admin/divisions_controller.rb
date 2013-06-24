class Admin::DivisionsController < Admin::AdminController
  def index
    @division = @school.divisions.build(params[:division])
    @divisions = @school.divisions.page(params[:page])
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @divisions }
    end
  end

  def create
    @division = @school.divisions.build(params[:division])

    respond_to do |format|
      if @division.save
        flash[:notice] = "Nowa klasa zostala dodana poprawnie."
        format.html { redirect_to admin_divisions_url }
        format.json { render :json => @division, :status => :created, :location => @division }
        format.js
      else
        format.html { render :action => "new" }
        format.json { render :json => @division.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def download_access_list
    @division = @school.divisions.find(params[:id])
    send_data @division.access_list, :filename => 'lista.txt'
  end

  def edit
    @division = @school.divisions.find(params[:id])
  end

  def update
    @division = @school.divisions.find(params[:id])

    respond_to do |format|
      if @division.update_attributes(params[:division])
        flash[:notice] = "Dane klasy zostaly zmienione."
        format.html { redirect_to admin_divisions_url }
        format.json { render :json => @division, :status => :created, :location => @division }
        format.js
      else
        format.html { render :action => "edit" }
        format.json { render :json => @division.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @division = @school.divisions.find(params[:id])

    respond_to do |format|
      if @division.destroy
        flash[:notice] = "Klasa zostala usunieta."
      else
        flash[:error] = "Klasa nie zostala usunieta. Dzwon do kogos kto wie co jest grane!"
      end

      format.html { redirect_to admin_divisions_url }
    end
  end
end