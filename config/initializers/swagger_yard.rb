# config/initializers/swagger_yard.rb
SwaggerYard.configure do |config|
  config.api_version = "1.0"
  config.reload = Rails.env.development?
  config.title = "Users-Service"
  config.description = "Service that owns the concern of user accounts for the bookstore"
  # where your actual api is hosted from
  config.api_base_path = "http://localhost:5002"
end
