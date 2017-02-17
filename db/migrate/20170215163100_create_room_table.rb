class CreateRoomTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :room do |t|
  		t.string :title
  		t.timestamps
  	end
  end
end
