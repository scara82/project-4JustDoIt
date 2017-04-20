class CarsController < ApplicationController
  def new
  end

  def create
    car = Car.new
    car.user_id = session[:id]
    car.description = params[:description]
    car.seat_number = params[:seat_number]
    car.meeting_point = params[:meeting_point]
    car.suburb = params[:suburb]
    car.smoker_friendly = params[:smoker_friendly]
    car.date = params[:date]
    car.time = params[:time]
    if car.save
      redirect_to '/cars'
    else
      redirect_to '/cars/new'
    end
  end

  def destroy
    car = Car.find_by(user_id: session[:id]).destroy
    redirect_to '/cars'
  end

  def join
    passenger = Passenger.new
    passenger.user_id = session[:id]
    passenger.car_id = params[:id]
    passenger.save
    redirect_to '/cars'
  end

  def unjoin
    passenger = Passenger.find_by(user_id: session[:id]).destroy
    redirect_to '/cars'
  end

  def show
    @car = Car.find(params[:id])
    @passengers = @car.passenger
  end
end