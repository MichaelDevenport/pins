ActiveAdmin.register Pin do

	controller do
	  def permitted_params
	    params.permit pin: [ :title, :description, :link, :yt_uid, :catergory_id ]
	  end
	end
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


end
