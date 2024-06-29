class AddRateToContracts < ActiveRecord::Migration[7.1]
  def change
    change_column :contracts, :rate, :decimal, :precision => 8, :scale => 2
  end
end
