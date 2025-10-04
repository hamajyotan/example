class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :account, index: { unique: true }, null: false, foreign_key: true
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
