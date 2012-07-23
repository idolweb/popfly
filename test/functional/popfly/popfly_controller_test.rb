require 'test_helper'

module Popfly
  class PopflyControllerTest < ActionController::TestCase

    test "should get index" do
      get :index, use_route: :root
      assert_response :success
    end

    # TODO: test if DB conn dropped? Connetion Pool handles this. Not wanting to retest all of Rails DB framework...

  end
end
