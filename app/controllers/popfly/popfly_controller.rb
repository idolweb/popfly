require_dependency "popfly/application_controller"

module Popfly
  class PopflyController < ApplicationController

    def index
      begin
        if conn = ActiveRecord::Base.connection
          ActiveRecord::Base.uncached do
            conn.execute('select 1')
          end
        else
          # This is likely unreachable. -RJ
          return send_status('No DB connection.')
        end
      rescue => e
        return send_status
      end
      return send_status('OK', :ok)
    end

    #------
    private

    def send_status(message = 'Application unavailable.', status = :service_unavailable)
      Rails.logger.fatal("#{message}") unless status == :ok
      render text: message, layout: false, status: status
    end

  end
end
