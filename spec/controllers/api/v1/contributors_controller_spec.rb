require 'rails_helper'

describe Api::V1::ContributorsController do
  describe 'GET #index' do
    subject(:http_request) do
      get :index
    end

    context 'when found results' do
      let(:contributors) { create_list(:contributor, 5) }

      before do
        contributors
        http_request
      end

      it 'returns the contributors' do
        expect(response_body['page']).to be_present
      end

      it 'responses with 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when there are no results' do
      before { http_request }

      it 'returns empty array' do
        expect(response_body['page']).to be_empty
      end

      it 'responses with 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
