Admin.find_or_create_by(id: 1) do |admin|
 admin.email = "admin@admin.com"
 admin.password = "admin"
end