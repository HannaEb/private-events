class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date
      t.time :start_time
      t.time :finish_time

      t.timestamps
    end
  end
end
