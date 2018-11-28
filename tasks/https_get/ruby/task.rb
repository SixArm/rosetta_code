require 'net/http'

uri = URI('https://example.com/my-path')

request = Net::HTTP::Get.new(uri.request_uri)
request['My-Header-Key'] = 'my-header-value'
request.body = "my-body-text"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
  http.request(request)
end

puts response.body
