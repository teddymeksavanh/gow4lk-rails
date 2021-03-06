# spec/requests/strolls_spec.rb
require 'rails_helper'

RSpec.describe 'Strolls API', type: :request do
  # add todos owner
  let(:user) { create(:user) }
  let!(:strolls) { create_list(:stroll, 10, created_by: user.id) }
  let(:stroll_id) { strolls.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # initialize test data 
  # let!(:strolls) { create_list(:stroll, 10) }
  # let(:stroll_id) { strolls.first.id }

  # Test suite for GET /strolls
  describe 'GET /strolls' do
    # make HTTP get request before each example
    before { get '/strolls', params: {}, headers: headers }

    it 'returns strolls' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /strolls/:id
  describe 'GET /strolls/:id' do
    before { get "/strolls/#{stroll_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the stroll' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(stroll_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:stroll_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Stroll/)
      end
    end
  end

  # Test suite for POST /strolls
  describe 'POST /strolls' do
    # valid payload
    let(:valid_attributes) do
      # send json payload
      {
        name: 'RunningPool',
        description: 'My running pool stroll',
        length: 12,
        city: 'Paris',
        country: 'France',
        latitude: -58.17256227443719,
        longitude: -156.65548382095133,
        created_by: user.id.to_s
    }.to_json

    context 'when the request is valid' do
      before { post '/strolls', params: valid_attributes, headers: headers }

      it 'creates a stroll' do
        expect(json['name']).to eq('RunningPool')
        expect(json['description']).to eq('My running pool stroll')
        expect(json['length']).to eq(12)
        expect(json['city']).to eq('Paris')
        expect(json['country']).to eq('France')
        expect(json['latitude']).to eq(-58.17256227443719)
        expect(json['longitude']).to eq(-156.65548382095133)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { 
        { 
          name: 'RunningPool',
          description: 'My running pool stroll',
          length: 12,
          country: 'France',
          latitude: '-58.17256227443719',
          longitude: '-156.65548382095133',
          created_by: user.id.to_s
        }.to_json 
      }

      before { post '/strolls', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: City can't be blank/)
      end
    end
  end

  # Test suite for PUT /strolls/:id
  describe 'PUT /strolls/:id' do
    let(:valid_attributes) { { name: 'Shopping route' }.to_json }

    context 'when the record exists' do
      before { put "/strolls/#{stroll_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        updated_stroll = Stroll.find(stroll_id)
        expect(updated_stroll.name).to match(/Shopping route/)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /strolls/:id
  describe 'DELETE /strolls/:id' do
    before { delete "/strolls/#{stroll_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end