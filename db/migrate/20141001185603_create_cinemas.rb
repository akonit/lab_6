class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :name
      t.text :description
      t.text :address

      t.timestamps
    end
  end
end
