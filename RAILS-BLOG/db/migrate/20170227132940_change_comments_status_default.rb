class ChangeCommentsStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :comments, :status, false
  end
end
