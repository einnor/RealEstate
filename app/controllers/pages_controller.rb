class PagesController < ApplicationController
  before_filter  :authenticate_landlord!, only: [:home]
  
  
  def index
    if signed_in?
      redirect_to houses_path
      return
    else
      # Make Login page the default page
     redirect_to new_admin_session_path
    end
    #render(:layout => "layouts/landing")
  end
  
  def home
  end

  def about
  end

  def contacts
  end
end
