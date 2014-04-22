require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contact_shares/2'
).to_s


# puts RestClient.post(url, {
#   contact_share: {
#     user_id: 4,
#     contact_id: 3
#   }
# }
# )


puts RestClient.delete(url, {})