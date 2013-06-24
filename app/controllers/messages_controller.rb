class MessagesController < ApplicationController
  add_breadcrumb I18n.t(".messages.index.title"), :messages_url

  def index
    @messages = current_user.received_folder.messages if params[:folder].blank?
    @messages = current_user.sent_folder.messages if params[:folder] == "sent"
    @messages = current_user.draft_folder.messages if params[:folder] == "draft"
    @messages = current_user.removed_folder.messages if params[:folder] == "removed"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @incoming_messages }
    end
  end

  def show
    @message = Message.find(params[:id])
    @message.update_attribute :is_read, true if @message.folder.name == "received"
    add_breadcrumb @message.title, message_url(@message)
  end

  def new
    add_breadcrumb I18n.t(".messages.new.title"), new_message_url
    @recipients = User.all
    @message = current_user.sent_messages.build
  end

  def move
    @message = Message.find(params[:id])
    @message.folder = current_user.folders.find_by_name(params[:folder])

    respond_to do |format|
      if @message.save
        flash[:notice] = "Wiadomosc zostala przeniesiona poprawnie."
        format.html { redirect_to messages_path }
      else
        format.html { redirect_to :back }
      end
    end    
  end

  def unread
    @message = Message.find(params[:id])
    @message.is_read = false

    respond_to do |format|
      if @message.save
        flash[:notice] = "Wiadomosc zostala zakualizowana poprawnie."
        format.html { redirect_to messages_path }
      else
        format.html { redirect_to :back }
      end
    end    
  end

  def create
    @message = current_user.sent_messages.build(
      :title => params[:message][:title],
      :body => params[:message][:body],
      :recipient_ids => params[:message][:recipient_ids]
    )

    @message.folder = current_user.sent_folder
    @message.set_recipient_names

    respond_to do |format|
      if @message.save
        flash[:notice] = "Wiadomosc zostala wyslana poprawnie."
        format.html { redirect_to messages_path }
        format.json { render :json => @message, :status => :created, :location => @message }
        format.js
      else
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.destroy
        flash[:notice] = "Wiadmosc zostala usunieta."
      else
        flash[:error] = "Wiadomosc nie zostala usunieta. Dzwon do kogos kto wie co jest grane!"
      end

      format.html { redirect_to messages_url }
    end
  end
end
