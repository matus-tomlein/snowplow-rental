# frozen_string_literal: true

require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snowplow = snowplows(:one)
    @reservation = reservations(:one)
  end

  test 'should get new' do
    get new_snowplow_reservation_url(@snowplow)
    assert_response :success
  end

  test 'should show reservation' do
    get snowplow_reservation_url(@snowplow, @reservation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_snowplow_reservation_url(@snowplow, @reservation)
    assert_response :success
  end

  test 'should update reservation' do
    patch snowplow_reservation_url(@snowplow, @reservation),
          params: { reservation: { first_name: @reservation.first_name, last_name: @reservation.last_name,
                                   since: @reservation.since, until: @reservation.until } }
    assert_redirected_to snowplow_reservation_url(@snowplow, @reservation)
  end

  test 'should destroy reservation' do
    assert_difference('Reservation.count', -1) do
      delete snowplow_reservation_url(@snowplow, @reservation)
    end

    assert_redirected_to snowplow_url(@snowplow)
  end
end
