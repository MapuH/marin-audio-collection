ActiveAdmin.register Album do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  permit_params :title, :artist, :year, :cd_number, :genre, :tracks_num, :label, :image, :listen

  index do
    column :title
    column :artist
    column :year
    column "Number of Tracks", :tracks_num
    column "YouTube Link", :listen do |album|
      link_to "Listen on YouTube", album.listen, target: "_blank"   
    end
    actions
  end

end
