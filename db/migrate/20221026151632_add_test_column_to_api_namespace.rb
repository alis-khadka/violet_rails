class AddTestColumnToApiNamespace < ActiveRecord::Migration[6.1]
  def change
    add_column :api_namespaces, :test_column, :boolean, default: true
  end
end
