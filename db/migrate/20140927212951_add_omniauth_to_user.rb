class AddOmniauthToUser < ActiveRecord::Migration
  # http://natashatherobot.com/rails-omniauth-github-tutorial/
  def change
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	add_column :users, :name, :string
  end  
end
