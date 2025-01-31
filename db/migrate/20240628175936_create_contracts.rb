class CreateContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :contracts do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
