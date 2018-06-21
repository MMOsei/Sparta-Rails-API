module Api
  module V1
    class LovecraftsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        lovecrafts = Lovecraft.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded lovecrafts', data: lovecrafts}, status: :ok
      end

      def show
        lovecraft = Lovecraft.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded lovecraft', data: lovecraft}, status: :ok
      end

      def create
        lovecraft = Lovecraft.new(lovecraft_params)
        if lovecraft.save
          render json: {status: 'SUCCESS', message: 'Saved lovecraft', data: lovecraft}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Lovecraft not saved', data: lovecraft.errors}, status: :unprocessable_entity
        end

      end

      def destroy
        lovecraft = Lovecraft.find(params[:id])
        lovecraft.destroy
        render json: {status: 'SUCCESS', message: 'Deleted lovecraft', data: lovecraft}, status: :ok
      end

      def update
        lovecraft = Lovecraft.find(params[:id])
        if lovecraft.update_attributes(lovecraft_params)
          render json: {status: 'SUCCESS', message: 'Updated lovecraft', data: lovecraft}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Lovecraft not updated', data: lovecraft.errors}, status: :unprocessable_entity
        end
      end

      private

      def lovecraft_params
        params.permit(:deity, :tome, :location, :word, :sentence)

      end

    end
  end
end
