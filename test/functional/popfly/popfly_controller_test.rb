require 'test_helper'

module Popfly
  class PopflyControllerTest < ActionController::TestCase

    def setup
      # FIXME: there has to be a better way to force the DB back into original state
      require 'dummy/db/schema'
    end

    test "should get index" do
      get :index, use_route: :root
      assert_response :success
    end

    test "should error if no tables" do
      # FIXME: this seems a horribly crufty way to clear out the tables, but I didn't want to fork out to rake...
      conn = ActiveRecord::Base.connection
      conn.tables.each {|t| conn.execute("drop table #{t}")}
      
      get :index, use_route: :root
      assert_response :service_unavailable
    end

    # TODO: test if DB conn dropped? Connetion Pool handles this. Not wanting to retest all of Rails DB framework...

  end
end
