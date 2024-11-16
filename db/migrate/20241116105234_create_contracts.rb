class CreateContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :contracts do |t|
      t.string :name
      t.string :location
      t.string :avatar_url
      t.boolean :killed

      t.timestamps
    end
  end
end
