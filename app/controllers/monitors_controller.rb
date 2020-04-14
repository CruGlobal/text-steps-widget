# frozen_string_literal: true

class MonitorsController < ApplicationController
  protect_from_forgery with: :exception

  layout nil

  def lb
    ActiveRecord::Migration.check_pending!
    render plain: File.read(Rails.public_path.join('lb.txt'))
  rescue ActiveRecord::PendingMigrationError
    render plain: 'PENDING MIGRATIONS', status: :service_unavailable
  end

  def commit
    render plain: ENV['GIT_COMMIT']
  end
end
