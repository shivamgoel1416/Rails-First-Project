class DropUserRole < ActiveRecord::Migration[5.0]
  def up
    drop_table :user_roles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
