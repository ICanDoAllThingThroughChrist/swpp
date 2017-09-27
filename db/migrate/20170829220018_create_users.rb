class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  	t.string  "username"
    t.string  "email"
    t.integer "password"
    t.integer "order_id"
    t.string  "password_digest"
	end
  end
end
