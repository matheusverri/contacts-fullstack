json.extract! contact, :id, :name, :cpf, :phone_number, :cep, :address, :lat, :lng, :created_at, :updated_at
json.url contact_url(contact, format: :json)
