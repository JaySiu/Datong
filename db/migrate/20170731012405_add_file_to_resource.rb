class AddFileToResource < ActiveRecord::Migration
  def change
    add_column :resources, :file_contents, :binary
  end
end
