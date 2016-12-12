class CreateClients < ActiveRecord::Migration[5.0]
  def change
  	create_table :client do |t|
  		t.text :name
  		t.text :phone
  		t.text :dateStamp
  		t.text :barber_name
  		t.text :color

  		t.timestamps
  	end
  end
end
