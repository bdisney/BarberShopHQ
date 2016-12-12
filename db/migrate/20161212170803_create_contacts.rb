class CreateContacts < ActiveRecord::Migration[5.0]
  def change
  	create_table :contacts do |t|
  		t.text :name
  		t.text :message
  		t.text :phone
  		
  		t.timestamps
  	end  	
  end
end
