class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from StandardError, with: :internal_server_error
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
