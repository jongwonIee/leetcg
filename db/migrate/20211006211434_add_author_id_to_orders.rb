class AddAuthorIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :author_id, :integer
  end
end
