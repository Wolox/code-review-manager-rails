require 'rails_helper'

describe Api::V1::ProjectsController do
  describe action '#index' do
    subject(:index_request) { get :index }
    describe example 'when calling the endpoint without any params' do
      default_example

      before do
        build_stubbed_list(:project, 5)
        index_request
      end
      
      it 'returns an ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'matchs the projects index schema' do
        expect(response).to match_response_schema('projects/index')
      end
    end
  end
end