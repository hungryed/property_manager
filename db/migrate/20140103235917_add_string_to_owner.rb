class AddStringToOwner < ActiveRecord::Migration
  def up
    add_column :owners, :display_string, :string
    owners = Owner.all
    owners.each do |owner|
      first_name = owner.first_name
      last_name = owner.last_name
      owner.display_string = "#{first_name} #{last_name}"
    end
    change_column :owners, :display_string, :string, null: false
  end

  def down
    remove_column :owners, :display_string
  end
end
