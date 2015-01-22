class HousesController < ApplicationController
  
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def show
  end

  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to root_url, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to root_url, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @houses }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_house
    #code
    @house = House.find(params[:id])
  end
  
  def house_params
    params.require(:house).permit(:location, :numberOfBedRooms, :numberOfBathRooms, :numberOfReceptionRooms, :size, :security, :photo)
  end
end
