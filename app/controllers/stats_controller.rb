class StatsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Rails.logger.info "Received data: #{request.raw_post}"

    stats_data = JSON.parse(request.raw_post)
    render json: { received: stats_data }
  end
end
