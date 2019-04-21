paises = {
    Mexico: 70,
    Chile: 50,
    Argentina: 55
}

paises.each do |k,v|
    puts k
end


paises.each do |k,v|
    puts v
end

paises.each do |k,v|
    puts v if v > 55
end