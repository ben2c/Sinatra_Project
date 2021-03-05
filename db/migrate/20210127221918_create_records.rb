class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :p_name
      t.string :sex
      t.integer :age
      t.string :disease
      
    end
  end
end
