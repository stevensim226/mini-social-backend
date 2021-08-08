class UpdateStatusUpdates < ActiveRecord::Migration[6.1]
  def change
    add_column :status_updates, :pfp_url, :string, default: "https://t3.ftcdn.net/jpg/01/09/00/64/360_F_109006426_388PagqielgjFTAMgW59jRaDmPJvSBUL.jpg"
  end
end
