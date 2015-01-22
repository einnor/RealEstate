class PagesController < ApplicationController
  before_filter  :authenticate_landlord!, only: [:home]
  
  def home
  end

  def about
  end

  def contacts
  end
end
