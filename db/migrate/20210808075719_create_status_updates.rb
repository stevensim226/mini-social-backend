class CreateStatusUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :status_updates, id: :uuid do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
