# frozen_string_literal: true

require 'application_system_test_case'

class SnowplowsTest < ApplicationSystemTestCase
  setup do
    @snowplow = snowplows(:one)
  end

  test 'visiting the index' do
    visit snowplows_url
    assert_selector 'h1', text: 'Snowplows'
  end

  test 'creating a Snowplow' do
    visit snowplows_url
    click_on 'New Snowplow'

    fill_in 'Description', with: @snowplow.description
    fill_in 'Name', with: @snowplow.name
    click_on 'Create Snowplow'

    assert_text 'Snowplow was successfully created'
    click_on 'Back'
  end

  test 'updating a Snowplow' do
    visit snowplows_url
    click_on 'Edit', match: :first

    fill_in 'Description', with: @snowplow.description
    fill_in 'Name', with: @snowplow.name
    click_on 'Update Snowplow'

    assert_text 'Snowplow was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Snowplow' do
    visit snowplows_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Snowplow was successfully destroyed'
  end
end
