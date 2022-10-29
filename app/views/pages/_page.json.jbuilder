json.extract! page, :id, :first_name, :last_name, :about, :created_at, :updated_at
json.url page_url(page, format: :json)
