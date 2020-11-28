ActiveAdmin.register User do
   permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :profile, :image

   index do
    selectable_column
    id_column
    column :email
    column :reset_token
    column :remember_created_at
    column :username
    column "ルーム数" do |user|
      user.rooms.count
    end
    column :created_at
    column :updated_at
    column :profile
    column :image
    actions
  end
end
