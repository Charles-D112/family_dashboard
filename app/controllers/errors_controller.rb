class ErrorsController < ApplicationController

  layout false

  def not_found
    if Rails.env.production?
      render 'errors/404', status: 404
    else
      render 'errors/404', status: 200
    end
  end

  def internal_server_error
    if Rails.env.production?
      render 'errors/500', status: 500
    else
      render 'errors/500', status: 200
    end
  end
end
