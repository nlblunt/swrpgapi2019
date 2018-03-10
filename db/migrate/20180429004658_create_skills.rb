class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :attrib
      t.text :description


      t.timestamps null: false
    end
    
  end
end
