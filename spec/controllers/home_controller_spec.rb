# Tests for home_controller.rb

require 'rails_helper'

describe HomeController, type: :controller do
  describe 'GET index' do
    # This is a necessary hack or the devise authenticate! method throws an error
    before :each do
      sign_out :user
    end

    it 'redirects to new_user_session_path if user is not logged in' do
      get :index
      expect( response ).to redirect_to new_user_session_path
    end

    it 'renders the index template if user is logged in' do
      # Must have a signed in user to get index page
      @user = create( :user )
      sign_in @user
      get :index
      expect( response ).to render_template( 'index' )
    end
  end
end
