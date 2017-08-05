class AddContentType < ActiveRecord::Migration
  def change
    add_column :resources, :file_contents, :binary
    add_column :resources, :file_type, :string
  end
end
