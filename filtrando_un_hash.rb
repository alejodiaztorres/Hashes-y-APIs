ventas = {
    Octubre: 65000,
    Noviembre: 68000,
    Diciembre: 72000
}

#=============Manera de filtrar =========
# ventas.map do |k,v|
#     puts v if v < 70000
# end

# =======================================



# ============= CON METODO ================

def filtrando(ventas)
    ventas.group_by {|x| x.to_i > 70000}
end