class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :name
      t.date :date
      t.integer :recurrent
      t.date :until_date

      t.timestamps
    end
  end
end
