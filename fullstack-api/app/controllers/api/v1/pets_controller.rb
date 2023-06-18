# frozen_string_literal: true

module Api
  module V1
    class PetsController < ApplicationController
      deserializable_resource :pet, only: [:create, :update]

      def index
        pets = Pet.filter(filter_params).order(featured: :asc, name: :asc)
        if pets
        render jsonapi: pets,
        # include: [:reviews],
        fields: { pet: [:name, :species, :age, :color, :breed, :favorite_food, :favorite_toy, :featured, :star_pet] },
        status: :ok
        else
        render json: { message: 'No pets found' }, status: :not_found
        end
      end 

      def show 
        pet = Pet.find(params[:id])
        if pet
        render jsonapi: pet,
        fields: { pet: [:name, :species, :age, :color, :breed, :favorite_food, :favorite_toy, :featured, :star_pet] },
        status: :ok
        else
        render json: { message: 'Pet not found' }, status: :not_found
        end
      end 

      def new 
        pet = Pet.new
      end

      def create
        pet = Pet.new(filter_params)
        if pet.save
        render jsonapi: pet,
        fields: { pet: [:name, :species, :age, :color, :breed, :favorite_food, :favorite_toy, :featured, :star_pet] },
        status: :created
        else
        render json: { message: 'Pet not created' }, status: :unprocessable_entity
        end
      end 

      def update
        pet = Pet.find(params[:id])
        if pet.update(filter_params)
        render jsonapi: pet,
        fields: { pet: [:name, :species, :age, :color, :breed, :favorite_food, :favorite_toy, :featured, :star_pet] },
        status: :ok
        else
        render json: { message: 'Pet not updated' }, status: :unprocessable_entity
        end
      end

      def destroy
        pet = Pet.find(params[:id])
        if pet.destroy
        render json: { message: 'Pet deleted' }, status: :ok
        else
        render json: { message: 'Pet not deleted' }, status: :unprocessable_entity
        end
      end

      private

      # Define attributes this model can be filtered by
      def filter_params
        params.permit(filter: [:species, :breed, :age, :color, :favorite_food, :favorite_toy, :featured, :star_pet])
      end

    end
  end
end
