# frozen_string_literal: true

class FibonacciController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: { sequence: FibonacciService.new.create(fib_params[:target]) }, status: :ok
      end
    end
  end

  private

  def fib_params
    params.permit(:target)
  end
end
