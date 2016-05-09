class AddImageToTip < ActiveRecord::Migration
  def change
    add_attachment :tips, :image
  end
end
