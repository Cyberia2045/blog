class CreateUserTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
  		t.string :email
  		t.string :password
  		t.datetime :birthday
  		 
  	end
  end
end
