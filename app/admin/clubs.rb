ActiveAdmin.register Club do
   permit_params :name, :profile

   index do
    selectable_column
    id_column
    column :name
    column :profile
    column :created_at
    column :updated_at
    actions
  end
end
