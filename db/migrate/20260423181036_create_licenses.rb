class CreateLicenses < ActiveRecord::Migration[8.1]
  def change
    create_table :licenses do |t|
      t.string :app_name
      t.string :license_key
      t.string :email
      t.datetime :expiry_date
      t.string :status

      t.timestamps
    end
  end
end
