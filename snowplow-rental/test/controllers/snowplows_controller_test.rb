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

  test 'should get new' do
    get new_snowplow_url
    assert_response :success
  end

  test 'should create snowplow' do
    assert_difference('Snowplow.count') do
      post snowplows_url, params: { snowplow: { description: @snowplow.description, name: @snowplow.name } }
    end

    assert_redirected_to snowplow_url(Snowplow.last)
  end

  test 'should show snowplow' do
    get snowplow_url(@snowplow)
    assert_response :success
  end

  test 'should get edit' do
    get edit_snowplow_url(@snowplow)
    assert_response :success
  end

  test 'should update snowplow' do
    patch snowplow_url(@snowplow), params: { snowplow: { description: @snowplow.description, name: @snowplow.name } }
    assert_redirected_to snowplow_url(@snowplow)
  end

  test 'should destroy snowplow' do
    assert_difference('Snowplow.count', -1) do
      delete snowplow_url(@snowplow)
    end

    assert_redirected_to snowplows_url
  end
end
