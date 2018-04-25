class CreateArmors < ActiveRecord::Migration[5.2]
  def change
    create_table :armors do |t|
      t.string :name
      t.text :description
      t.integer :defense
      t.integer :soak
      t.integer :price
      t.text :notes
      t.boolean :template, :default => true
      
      t.timestamps null: false
    end

    create_table :armors_pcs do |t|
      t.belongs_to :armor
      t.belongs_to :pc
    end
  end
end
