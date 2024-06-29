class RemoveRateFromContracts < ActiveRecord::Migration[7.1]
  def change
    remove_column :contracts, :rate, :integer
  end
end
