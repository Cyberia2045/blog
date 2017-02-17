class CreateJoinroomuserTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :joinroomuser do |t|
  		t.integer :user_id
  		t.integer :room_id
  	end
  end
end
