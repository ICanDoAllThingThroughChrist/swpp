require './config/environment'
require_relative 'app/controllers/orders_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use OrdersController
run ApplicationController

