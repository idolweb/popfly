require_dependency "popfly/application_controller"

module Popfly
  class PopflyController < ApplicationController

    def index
      begin
        if conn = ActiveRecord::Base.connection
          if tables = conn.tables and tables.blank?
            no_tables = 'No tables defined in DB. Run your migrations!'
            return send_status(no_tables)
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
      Rails.logger.fatal("#{message}")
      render text: message, layout: false, status: status
    end

  end
end
