json.extract! uploaded_file, :id, :images, :created_at, :updated_at
json.url uploaded_file_url(uploaded_file, format: :json)
