# frozen_string_literal: true

class SnowplowsController < ApplicationController
  before_action :set_snowplow, only: %i[show edit update destroy]

  def index
    @snowplows = Snowplow.all
  end

  def show; end

  private

  def set_snowplow
    @snowplow = Snowplow.find(params[:id])
  end

  def track_page_view
    if defined? @snowplow
      snowplow_tracker.track_page_view(request.url, nil, nil, [@snowplow.to_snowplow_json])
    else
      snowplow_tracker.track_page_view(request.url)
    end
  end

end
