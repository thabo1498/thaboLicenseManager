class AddUniqueIndexToLicensesAppName < ActiveRecord::Migration[8.1]
  def change
    add_index :licenses, :app_name, unique: true
  end
end
