class AddChefIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :chef_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
