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
    @person.update! person_params
    redirect_to people_path
  end

  def destroy
    @person = Person.find params["id"]
    @person.destroy!
    redirect_to people_path
  end

  def person_params
    params.require("person").permit("name", "email", "age", "address")
  end
end
