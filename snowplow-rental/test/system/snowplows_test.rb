# frozen_string_literal: true

require 'application_system_test_case'

class SnowplowsTest < ApplicationSystemTestCase
  setup do
    @snowplow = snowplows(:one)
  end

  test 'visiting the index' do
    visit snowplows_url
    assert_selector 'h1', text: 'Snowplow Rental'
  end
end