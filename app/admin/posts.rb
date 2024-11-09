ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :text, :author_id, :likes_counter, :comments_counter, :cover
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :text, :author_id, :likes_counter, :comments_counter, :cover]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
