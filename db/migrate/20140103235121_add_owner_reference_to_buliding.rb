class AddOwnerReferenceToBuliding < ActiveRecord::Migration
  def up
    add_reference :buildings, :owner, index: true
  end

  def down
    remove_column :buildings, :owner_id
  end
end
