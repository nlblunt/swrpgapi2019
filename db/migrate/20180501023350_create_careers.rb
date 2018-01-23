class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|
      t.string :name
      t.text   :description
      
      t.timestamps null: false
    end
    
    create_table :careers_skills, id: false do |t|
      t.belongs_to :career
      t.belongs_to :skill
    end
    
    create_table :careers_pcs, id: false do |t|
      t.belongs_to :career
      t.belongs_to :pc
    end
  end
end
