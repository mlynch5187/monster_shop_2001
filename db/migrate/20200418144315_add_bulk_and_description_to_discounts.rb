class AddBulkAndDescriptionToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :bulk, :integer
    add_column :discounts, :description, :string
  end
end
