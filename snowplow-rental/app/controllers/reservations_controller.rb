# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_snowplow
  before_action :set_reservation, only: %i[show edit update destroy]

  def show; end

  def new
    @reservation = Reservation.new
  end

  def edit; end

  def create
    @reservation = @snowplow.reservations.new(reservation_params)

    if @reservation.save
      redirect_to [@snowplow, @reservation], notice: 'Reservation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to [@snowplow, @reservation], notice: 'Reservation was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to @snowplow, notice: 'Reservation was successfully destroyed.'
  end

  private

  def set_snowplow
    @snowplow = Snowplow.find(params[:snowplow_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:snowplow_id, :first_name, :last_name, :since, :until)
  end

  def track_page_view
    if defined?(@reservation) && !@reservation.id.nil?
      snowplow_tracker.track_page_view(request.url, nil, nil, [@snowplow.to_snowplow_json, @reservation.to_snowplow_json])
    else
      snowplow_tracker.track_page_view(request.url, nil, nil, [@snowplow.to_snowplow_json])
    end
  end
end
