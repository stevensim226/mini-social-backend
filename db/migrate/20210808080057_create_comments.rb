class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :content
      t.belongs_to :status_update

      t.timestamps
    end
  end
end
