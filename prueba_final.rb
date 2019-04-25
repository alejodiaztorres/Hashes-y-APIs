require 'uri'
require 'net/http'
require 'json'
require 'openssl'


def request(url, api_key)

    url  = URI(url + "&api_key=" + api_key) #Declaro el primer parametro, con la libreria URI
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true # Se agrega esta línea
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER # Se agrega esta otra línea
    request = Net::HTTP::Get.new(url)
    request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
    request["cache-control"] = 'no-cache'
    request["Postman-Token"] = 'b5ab61dd-a428-48e7-8d80-3904f9db8885'
    request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"api_key\"\r\n\r\nztaGDZAcjV8j0FrfkTJz1iQtvyeDtug5b7HfJxyd\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
    response = http.request(request)
    JSON.parse(response.read_body)
    
end

api_key = "ztaGDZAcjV8j0FrfkTJz1iQtvyeDtug5b7HfJxyd" #Declaro mi api key 

datoFinal = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10', api_key) #Le envio los dos parametros que tiene el metodo, la url y el api key


# =======================================================SEGUNDO PUNTO A SOLUCIONAR ===========================================================

def buid_web_page(data)

    puts "=============================="
    
    images = data['photos'].map { |x| x['img_src'] }

    doc_html = "<html>\n<head>\n</head>\n<body>\n<ul>\n"
    images.each do |photo|
        doc_html += "\t<li><img src='#{photo}'></li>\n"
    end
    doc_html += "</ul>\n</body>\n</html>"

    File.write('photos.html', doc_html)
end

buid_web_page(datoFinal)





# ======================================================        BONUS       =========================================================

def photos_count(datoFinal)
    contando = {}
    datoFinal.map{|x| contando[x['camera']['name']] = 1 + contando[x['camera']['name']].to_i}
    return contando
end
puts photos_count(datoFinal)























