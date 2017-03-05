class CreateRoleWisePages < ActiveRecord::Migration[5.0]
  def change
    create_table :role_wise_pages do |t|
      t.references :role, foreign_key: true
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
