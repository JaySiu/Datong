class AddContentType < ActiveRecord::Migration
  def change
    add_column :resources, :file_type, :string
    add_column :resources, :file_contents, :binary
  end
end
