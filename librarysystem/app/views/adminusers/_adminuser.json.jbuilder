json.extract! adminuser, :id, :email, :name, :password, :created_at, :updated_at
json.url adminuser_url(adminuser, format: :json)
