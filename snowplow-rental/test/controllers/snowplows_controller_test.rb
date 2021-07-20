# frozen_string_literal: true

require 'test_helper'

class SnowplowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snowplow = snowplows(:one)
  end

  test 'should get index' do
    get snowplows_url
    assert_response :success
  end

  test 'should show snowplow' do
    get snowplow_url(@snowplow)
    assert_response :success
  end
end
