class AddDepartmentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :department, foreign_key: true
  end
end
