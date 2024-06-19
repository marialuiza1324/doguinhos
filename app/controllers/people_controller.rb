class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find params["id"]
  end

  def edit
    @person = Person.find params["id"]
  end

  def new
    @person = Person.new
    @person.dogs.new
  end

  def create
    @person = Person.new person_params
    if @person.save
      redirect_to people_path
    else
      render :new, status: 422
    end
  end

  def update
    @person = Person.find params["id"]

    if @person.update person_params
      redirect_to person_path(@person)
    else
      render :edit, status: 422
    end
  end

  def destroy
    @person = Person.find params["id"]
    @person.destroy!
    redirect_to people_path
  end

  def person_params
    params.require("person").permit("name", "email", "age", "address", "dogs_attributes" => ["name", "breed", "color"])
  end
end
