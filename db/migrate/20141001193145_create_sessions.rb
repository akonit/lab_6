class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.timestamp :start
      t.timestamp :end
      t.references :film, index: true
      t.references :cinema, index: true

      t.timestamps
    end
  end
end
