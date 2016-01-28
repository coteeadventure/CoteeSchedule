class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to reservations_path
    else
      redirect_to reset_reservation_path
    end
  end
end
