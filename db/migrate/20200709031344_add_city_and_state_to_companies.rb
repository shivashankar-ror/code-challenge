class AddCityAndStateToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :city,  :string, limit: 100
    add_column :companies, :state, :string, limit: 100
  end
end
