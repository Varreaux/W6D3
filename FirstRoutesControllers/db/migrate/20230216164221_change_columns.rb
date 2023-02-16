class ChangeColumns < ActiveRecord::Migration[7.0]
  def change
    drop_table :columns
  end
end
