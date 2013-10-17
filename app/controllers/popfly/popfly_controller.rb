require_dependency "popfly/application_controller"

module Popfly
  class PopflyController < ApplicationController

    def index
      begin
        if ActiveRecord::Base.connection.active?
          send_status('OK', :ok)
        else
          send_status('No DB connection.')
        end
      rescue => e
        send_status
      end
    end

    #------
    private

    def send_status(message = 'Application unavailable.', status = :service_unavailable)
      Rails.logger.fatal("#{message}") unless status == :ok
      render text: message, layout: false, status: status
    end

  end
end
