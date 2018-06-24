# spec/requests/types_spec.rb
require 'rails_helper'

RSpec.describe 'Types API' do
  # Initialize the test data
  let!(:stroll) { create(:stroll) }
  let!(:types) { create_list(:type, 20, stroll_id: stroll.id) }
  let(:stroll_id) { stroll.id }
  let(:id) { types.first.id }

  # Test suite for GET /strolls/:stroll_id/types
  describe 'GET /strolls/:stroll_id/types' do
    before { get "/strolls/#{stroll_id}/types" }

    context 'when stroll exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all stroll types' do
        expect(json.size).to eq(20)
      end
    end

    context 'when stroll does not exist' do
      let(:stroll_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Stroll/)
      end
    end
  end

  # Test suite for GET /strolls/:stroll_id/types/:id
  describe 'GET /strolls/:stroll_id/types/:id' do
    before { get "/strolls/#{stroll_id}/types/#{id}" }

    context 'when stroll type exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the type' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when stroll type does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Type/)
      end
    end
  end

  # Test suite for POST /strolls/:stroll_id/types
  describe 'POST /strolls/:stroll_id/types' do
    let(:valid_attributes) { {
        name: 'Narnia',
        color: '#f8f8f8',
        description: 'Visit narnia'
    } }

    context 'when request is valid' do
      before { post "/strolls/#{stroll_id}/types", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the resquest is invalid' do
      before { post "/strolls/#{stroll_id}/types", params: {
        color: '#f8f8f8',
        description: 'Visit narnia'
      } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /strolls/:stroll_id/types/:id
  describe 'PUT /strolls/:stroll_id/types/:id' do
    let(:valid_attributes) { {
        name: 'HarryPotter'
    } }

    before { put "/strolls/#{stroll_id}/types/#{id}", params: valid_attributes }

    context 'when type exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the type' do
        updated_type = Type.find(id)
        expect(updated_type.name).to match(/HarryPotter/)
      end
    end

    context 'when the type does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Type/)
      end
    end
  end

  # Test suite for DELETE /strolls/:id
  describe 'DELETE /strolls/:id' do
    before { delete "/strolls/#{stroll_id}/types/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end