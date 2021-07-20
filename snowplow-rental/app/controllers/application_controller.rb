# frozen_string_literal: true

class ApplicationController < ActionController::Base
  after_action :track_page_view

  def initialize
    super
    set_snowplow_emitter
  end

  protected

  def snowplow_tracker
    subject = SnowplowTracker::Subject.new
    subject.set_domain_user_id(snowplow_domain_userid)
    tracker = SnowplowTracker::Tracker.new(@snowplow_emitter, subject, nil, 'snowplow-rental', false)
    tracker.set_useragent(request.user_agent)
    tracker
  end

  def track_page_view
    snowplow_tracker.track_page_view(request.url)
  end

  private

  def set_snowplow_emitter
    @snowplow_emitter = SnowplowTracker::Emitter.new('micro:9090')
  end
end
