class ChangeRatePrecisionInContracts < ActiveRecord::Migration[7.1]
  def change
    change_column :contracts, :rate, :integer
  end
end
