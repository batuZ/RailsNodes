#08_迁移文件_migrate.rb

$ bin/rails g model User u_name:string u_email:string u_level password:string
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :u_name
      t.string :u_email
      t.integer :u_level default: 0
      t.string :u_password
      
      t.timestamps
    end
  end
end



$ bin/rails generate migration AddPartNumberToProducts part_number:string