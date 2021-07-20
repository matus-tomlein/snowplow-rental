# frozen_string_literal: true

require 'application_system_test_case'

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @snowplow = snowplows(:one)
    @reservation = reservations(:one)
  end

  test 'updating a Reservation' do
    visit snowplow_url(@snowplow)
    click_on 'Edit', match: :first

    fill_in 'First name', with: @reservation.first_name
    fill_in 'Last name', with: @reservation.last_name
    click_on 'Update Reservation'

    assert_text 'Reservation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Reservation' do
    visit snowplow_url(@snowplow)
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Reservation was successfully destroyed'
  end
end
