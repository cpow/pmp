class UsersController < ApplicationController
  skip_before_filter :login_required
  
  def getcompanies
    @user = User.find(params[:id])
    render :xml => @user.companies
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  #GET /users/new
  #GET /users/new.xml
  
  # render new.rhtml
  def new
  end

  #POST /users
  #POST /users.xml
  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Thanks for signing up!"
      end
      format.xml {render :xml => @user.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
      respond_to do |format|
        format.html {render :action => 'new'}
        format.xml {render :text => "error"}
    end
  end
end

 


