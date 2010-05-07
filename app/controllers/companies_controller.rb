class CompaniesController < ApplicationController
 
  def packsupdate
    @company = Company.find(params[:id])
    
    if @company.packs == 0
      render :text => "nopacks"
      return
      
    else if @company.packs != 0
      @company.decrement!(:packs)
      @company.update_attributes(params[:company])
    end
  end
  redirect_to :controller => 'companies', :action => 'index'
end

 
 
 # GET /all_companies
 # GET /all_companies.xml
  def all_companies
    @companies = Company.find(:all)
    render :xml => @companies 
 end
  
  
  # GET /companies
  # GET /companies.xml
  def index
    @companies = current_user.companies
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    @company = current_user.companies.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = current_user.companies.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = current_user.companies.build(params[:company])

    respond_to do |format|
      if @company.save
        format.html do
        flash[:notice] = 'Company was successfully created.'
        redirect_to(@company)
      end
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = current_user.companies.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = 'Company was successfully updated.'
        format.html { redirect_to(@company) }
        format.xml  { render :xml => @company }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = current_user.companies.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { render :xml => @company }
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
  
 
  
  private
  def prevent_access(e)
    logger.info "CompaniesController#prevent_access: #{e}"
    respond_to do |format|
      format.html {redirect_to(companies_url)}
      format.xml {render :text => "error"}
    end
  end
end
