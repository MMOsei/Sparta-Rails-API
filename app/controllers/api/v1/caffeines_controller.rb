module Api
  module V1
    class CaffeinesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        caffeines = Caffeine.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded caffeines', data: caffeines}, status: :ok
      end

      def show
        caffeine = Caffeine.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded caffeine', data: caffeine}, status: :ok
      end

      def create
        caffeine = Caffeine.new(caffeine_params)
        if caffeine.save
          render json: {status: 'SUCCESS', message: 'Saved caffeine', data: caffeine}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Caffeine not saved', data: caffeine.errors}, status: :unprocessable_entity
        end

      end

      def destroy
        caffeine = Caffeine.find(params[:id])
        caffeine.destroy
        render json: {status: 'SUCCESS', message: 'Deleted caffeine', data: caffeine}, status: :ok
      end

      def update
        caffeine = Caffeine.find(params[:id])
        if caffeine.update_attributes(caffeine_params)
          render json: {status: 'SUCCESS', message: 'Updated caffeine', data: caffeine}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Caffeine not updated', data: caffeine.errors}, status: :unprocessable_entity
        end
      end

      private

      def caffeine_params
        params.permit(:blend_name, :origin, :variety, :notes, :intensifier)

      end

    end
  end
end
