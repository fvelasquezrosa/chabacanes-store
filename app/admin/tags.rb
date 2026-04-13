ActiveAdmin.register Tag do
  permit_params :name

  config.filters = false
end
