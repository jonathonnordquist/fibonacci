# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe FibonacciController do
  describe 'GET index' do
    context 'html request' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template ('index')
      end
    end

    context 'json request' do
      context 'with proper input' do
        let(:result) { '0 0 1 2 3 5' }
        let(:target) { '6' }
        before { expect(FibonacciService).to receive(:create).with(target).and_return(result) }

        it 'renders a proper json response' do
          get :index, format: :json, params: { target: target }
          expect(JSON.parse(response.body)).to eq({ 'sequence' => result })
        end
      end

      context 'with impropper input' do
        let(:target) { 'aaa' }
        let(:error_text)  { 'Some error text here' }
        before { expect(FibonacciService).to receive(:create).with(target).and_raise(ArgumentError.new(error_text)) }

        it 'renders a proper json response' do
          get :index, format: :json, params: { target: target }
          expect(JSON.parse(response.body)).to eq({ 'error' => error_text })
        end
      end
    end
  end
end
