class AddRateToContracts < ActiveRecord::Migration[7.1]
  def change
    add_column :contracts, :rate, :decimal
  end
end
