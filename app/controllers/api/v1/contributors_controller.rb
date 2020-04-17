module Api
  module V1
    class ContributorsController < ApplicationController
      include Wor::Paginate

      def index
        render_paginated Contributor, each_serializer: ContributorSerializer
      end

      def update
        contributor = Contributor.find(params[:id])
        return render json: contributor, status: :ok if contributor.update(update_params)

        render json: { errors: contributor.errors }, status: :bad_request
      end

      private

      def update_params
        params.permit(:name, :workload, :country, :admission_date, :roles)
      end
    end
  end
end
