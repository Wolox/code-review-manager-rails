module Api
  module V1
    class ContributorsController < ApplicationController
      include Wor::Paginate

      def index
        render_paginated Contributor, each_serializer: ContributorSerializer
      end
    end
  end
end
