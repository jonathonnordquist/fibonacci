# frozen_string_literal: true

class FibonacciController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: { sequence: FibonacciService.create(fib_params[:target]) }
      rescue ArgumentError => e
        render json: { error: e.message }, status: :bad_request
      end
    end
  end

  private
    def fib_params
      params.permit(:target)
    end
end
