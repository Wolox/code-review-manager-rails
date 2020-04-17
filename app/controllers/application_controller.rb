# frozen_string_literal: true

class ApplicationController < ActionController::API
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def render_error(status, message)
    render json: message, status: status
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: error }, status: :bad_request
  end

  rescue_from ArgumentError do |error|
    render json: { errors: error }, status: :bad_request
  end
end
