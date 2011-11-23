class AdsController < ApplicationController
	
	before_filter :check_logged_in, :only => [:edit, :destroy]
 
  def show 
    @ad = Ad.find(params[:id])
  end
  
  def stats
    @seller = Seller.find(params[:id])
  end
  
  def index
    @ads = Ad.find(:all)
  end
  
  def new
    @ad = Ad.new
  end
  
  def create
    @ad=Ad.new(params[:ad])
    if @ad.save
    redirect_to "/ads/#{@ad.id}"
    else 
      render :template => "ads/new" 
   end
  end
    
  def edit
      @ad=Ad.find(params[:id])
      #logger.debug "The object is #{@ad}"
      #RAILS_DEFAULT_LOGGER.debug @ad
      #puts @ad.inspect
  end
     
  def update
      @ad=Ad.find(params[:id])
        if @ad.update_attributes(params[:ad])
          redirect_to ad_path(@ad)
        else 
          render :template=>"/ads/edit"
       end
      #redirect_to "/ads/#{@ad.id}"
  end
  
  def delete
      @ad=Ad.find(params[:id])
      @ad.destroy
      redirect_to '/ads'
  end
   
end

 private
  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
    	    username == "admin" && password == "apple"
    end
end

    	  


# notes for above: 
# 1. def show - this is a controller 'method' with a name that matches the name of 
# the action 'show' (it also matches entry for show in in routes.rb
# 2. @ad - query from the database (as requested in URL) is stored in the memory
# and assigned to a variable called @ad. Actually here is the important part - how
# exactly Rails read the record from the database? tha data from the database is
# concerted into an object. That object is stored in the memory and controller 
# assigns it the name @ad
# 3. Ad.find - method used to get information from the database.
