class CreateSnapshots < ActiveRecord::Migration[5.0]
  def change
    create_table :snapshots do |t|
      t.date :date
      t.integer :views
      t.references :episode, foreign_key: true

      t.timestamps
    end
  end
end
