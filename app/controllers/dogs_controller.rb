class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def show
    @dog = Dog.find params["id"]
  end

  def edit
    @dog = Dog.find params["id"]
  end

  def create
    @dog = Dog.new dog_params

    if @dog.save
      redirect_to dog_path(@dog.id)
    else
      render :new, status: 422
    end
  end

  def update
    @dog = Dog.find params["id"]

    if @dog.update dog_params
      redirect_to dog_path(@dog.id)
    else
      render :edit, status: 422
    end
  end

  def destroy
    @dog = Dog.find params["id"]
    @dog.destroy!
    redirect_to dogs_path
  end

  def dog_params
    params.require("dog").permit("name", "breed", "color", "person_id")
  end
end
