class CreateContributors < ActiveRecord::Migration[6.0]
  def change
    create_table :contributors do |t|
      t.string :name, null: false
      t.integer :workload, null: false
      t.integer :country, null: false, default: 0
      t.date :admission_date, null: false
      t.integer :contributor_type, null: false, default: 0
      
      t.timestamps
    end
  end
end
