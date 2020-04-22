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

      it 'matchs the projects index schema' do
        expect(response).to match_response_schema('contributors/index')
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

  describe 'PUT #update' do
    subject(:http_request) do
      put :update, params: update_params
    end

    let(:contributor) { create(:contributor) }
    let(:role) { create(:role) }

    before do
      contributor
      role
      http_request
    end

    context 'when all the params are valid' do
      let(:update_params) do
        FactoryBot.attributes_for(:contributor).merge(roles: [role], id: contributor.id)
      end

      it 'returns the contributors' do
        expect(response_body).to be_present
      end

      it 'responses with 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'matchs the projects index schema' do
        expect(response).to match_response_schema('contributors/update')
      end
    end

    context 'when there are not valid' do
      let(:update_params) do
        FactoryBot.attributes_for(:contributor, admission_date: 3.days.from_now)
                  .merge(roles: [role], id: contributor.id)
      end

      it 'returns errors' do
        expect(response_body['errors']).to be_present
      end

      it 'responses with status bad request' do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when there invalid id' do
      let(:update_params) do
        FactoryBot.attributes_for(:contributor)
                  .merge(roles: [role], id: Faker::Number.number(digits: 4))
      end

      it 'returns record not found error' do
        expect(response_body['errors']).to be_present
      end

      it 'responses with status bad request' do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when there invalid enums' do
      let(:update_params) do
        FactoryBot.attributes_for(:contributor, country: 'amsterdam')
                  .merge(roles: [role], id: Faker::Number.number(digits: 4))
      end

      it 'returns argument error' do
        expect(response_body['errors']).to be_present
      end

      it 'responses with status bad request' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
