class AddDiscountsToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_reference :merchants, :discount, foreign_key: true
  end
end
