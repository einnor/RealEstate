class HousesController < ApplicationController
  
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  
  def index
    @houses = House.all
    @total = 0.0
    
    @houses.each {|house|
      numberOfBedRooms = house.numberOfBedRooms
      numberOfBathRooms = house.numberOfBathRooms
      numberOfReceptionRooms = house.numberOfReceptionRooms
      size = house.size
      security = house.security
      
      price = cost_of_the_house(numberOfBedRooms, numberOfBathRooms, numberOfReceptionRooms, size, security)
      house.price = price
      house.save!
    }
    
    @houses.each {|house| @total += house.price }
    
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
  
  def cost_of_the_house(numberOfBedRooms, numberOfBathRooms, numberOfReceptionRooms, size, security)
    #calculate price for numberOfBedRooms
    @price = 0.0
    numberOfBedRooms = numberOfBedRooms.to_i
    numberOfBathRooms = numberOfBathRooms.to_i
    numberOfReceptionRooms = numberOfReceptionRooms.to_i
    size = size.to_i
    if numberOfBedRooms < 5
      #code
      @price = numberOfBedRooms * 3_000_000
    end
    if numberOfBedRooms > 4
      #code
      @price = 4 * 3_000_000
      numberOfBedRooms = numberOfBedRooms - 4
      @price += (numberOfBedRooms * 1_200_000)
    end
    
    puts @price
    
    #factor in cost from numberOfBathRooms
    @price += (@price * 0.05 * numberOfBathRooms)
    
    puts @price
    
    #factor in cost from numberOfReceptionRooms
    #error in question. confirm
    @price += (@price * (1.2 + (numberOfReceptionRooms - 1)**numberOfBedRooms))
    
    puts @price
    
    #factor in cost from size
    if size < 1_000
      #code
      difference = 1_000.0 - size
      cost_of_depreciation = difference/5.0 * 0.01
      @price -= cost_of_depreciation
    end
    if size > 1_000
      #code
      difference = size - 1_000.0
      cost_of_appreciation = difference/10.0 * 0.01
      @price += cost_of_appreciation
    end
    
    if security.downcase == "low"
      #code
      security_cost = @price * 0.2
      @price -= security_cost
    end
    if security.downcase == "medium"
      #code
    end
    if security.downcase == "high"
      #code
      security_cost = @price * 0.2
      @price += security_cost
    end
    
    puts @price
    @price
  end

end
