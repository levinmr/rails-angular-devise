# Controller to handle the main route.
#
# Currently this will direct to the login page when no current_user exists,
# and to the angular page otherwise
#
class HomeController < ApplicationController
  skip_authorization_check

  layout 'angular'
  #
  # Method to show the login page
  #
  def index
    # Once someone signs in, hand things over to the angular page
    if current_user && user_signed_in?
      render 'index'
    else
      redirect_to new_user_session_path
    end
  end
end
