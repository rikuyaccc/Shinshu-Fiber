ActiveAdmin.register Classroom do

  permit_params :name, :term, :week, :teacher
  
  index do
    selectable_column
    id_column
    column :name
    column :term
    column :week
    column :teacher
    column 'レビュー数' do |classroom|
      classroom.reviews.count
    end
    column :created_at
    column :updated_at
    actions
  end
end
