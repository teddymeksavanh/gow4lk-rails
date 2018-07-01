# spec/requests/paths_spec.rb
require 'rails_helper'

RSpec.describe 'Paths API' do
  let(:user) { create(:user) }
  let!(:stroll) { create(:stroll, created_by: user.id) }
  let!(:paths) { create_list(:path, 20, stroll_id: stroll.id) }
  let(:stroll_id) { stroll.id }
  let(:id) { paths.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /strolls/:stroll_id/paths
  describe 'GET /strolls/:stroll_id/paths' do
    before { get "/strolls/#{stroll_id}/paths", params: {}, headers: headers }

    context 'when stroll exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all stroll paths' do
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

  # Test suite for GET /strolls/:stroll_id/paths/:id
  describe 'GET /strolls/:stroll_id/paths/:id' do
    before { get "/strolls/#{stroll_id}/paths/#{id}", params: {}, headers: headers }

    context 'when stroll path exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the path' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when stroll path does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Path/)
      end
    end
  end

  # Test suite for POST /strolls/:stroll_id/paths
  describe 'POST /strolls/:stroll_id/paths' do
    let(:valid_attributes) { {
        name: 'Narnia',
        latitude: -58.17256227443719,
        longitude: -156.65548382095133,
        description: 'Visit narnia'
    }.to_json }

    context 'when request is valid' do
      before do
        post "/strolls/#{stroll_id}/paths", params: valid_attributes, headers: headers
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    # Not sure if i have to empty params
    context 'when the resquest is invalid' do
      before { post "/strolls/#{stroll_id}/paths", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /strolls/:stroll_id/paths/:id
  describe 'PUT /strolls/:stroll_id/paths/:id' do
    let(:valid_attributes) { {
        name: 'HarryPotter'
    }.to_json }

    before do
      put "/strolls/#{stroll_id}/paths/#{id}", params: valid_attributes, headers: headers
    end


    context 'when path exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the path' do
        updated_path = Path.find(id)
        expect(updated_path.name).to match(/HarryPotter/)
      end
    end

    context 'when the path does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Path/)
      end
    end
  end

  # Test suite for DELETE /strolls/:id
  describe 'DELETE /strolls/:id' do
    before { delete "/strolls/#{stroll_id}/paths/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end