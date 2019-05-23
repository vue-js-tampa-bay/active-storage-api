# frozen_string_literal: true

class ThingsController < ApplicationController
  def index
    @things = Thing.all
  end

  def show
    render json: specific_thing
  end

  def create
    thing = Thing.new(thing_params)
    if thing.save
      render json: {
        id: thing.id, name: thing.name, description: thing.description, image: url_for(thing.image)
      }, status: :created
    else
      render json: thing.errors, status: :unprocessable_entity
    end
  end

  def update
    if specific_thing.update(thing_params)
      render json: specific_thing
    else
      render json: specific_thing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    specific_thing.destroy
  end

  private

  def thing_params
    params.permit(:name, :description, :image)
  end

  def specific_thing
    @thing = Thing.find(params[:id])
  end
end
