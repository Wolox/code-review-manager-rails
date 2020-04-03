module Api
  module V1
    class ProjectsController < ApiController
      def index
        render_paginated Project
      end
    end
  end
end
