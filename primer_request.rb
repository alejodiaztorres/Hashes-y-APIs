require 'uri'
require 'net/http'

url = URI("http://jsonplaceholder.typicode.com/posts")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["cache-control"] = 'no-cache'
request["Postman-Token"] = 'd1d59fa6-5794-44c3-8208-8797256e6dc1'

response = http.request(request)
puts response.read_body