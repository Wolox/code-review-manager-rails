class CreateProyects < ActiveRecord::Migration[6.0]
  def change
    create_table :proyects do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
