class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
  end

  def show
    @dog = Dog.find params["id"]
  end

  def edit
    @dog = Dog.find params["id"]
  end

  def create
    @dog = Dog.create! name: params["name"], breed: params["breed"], color: params["color"]
    redirect_to dog_path(@dog.id)
  end

  def update
    dog = Dog.find params["id"]
    dog.update! name: params["name"], breed: params["breed"], color: params["color"]
    redirect_to dog_path(dog.id)
  end

  def destroy
    @dog = Dog.find params["id"]
    @dog.destroy!
    redirect_to dogs_path
  end
end
