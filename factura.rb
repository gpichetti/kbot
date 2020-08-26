class Factura
    def facturar(precio, cantidad, estado)

        hash_descuentos = {1000=> 3, 5000=> 5, 7000=> 7, 10000=> 10, 50000=> 15}
        hash_estado = {"UT"=> 6.85, "NV"=> 8.00, "TX"=> 6.25, "AL"=> 4.00, "CA"=> 3.75}

        sub_total = precio.to_f * cantidad.to_f

        descuento = hash_descuentos.select { |k| k < sub_total}
        if descuento.length > 0
            valor_descuento = descuento.values[descuento.length-1]  
            valor_descuento_f = valor_descuento.to_f/100
        else
            valor_descuento = 0
            valor_descuento_f = valor_descuento.to_f
        end
        
        impuesto = hash_estado[estado]
        if impuesto.nil?
            impuesto = 0
            impuesto_f = impuesto.to_f
        else
            impuesto_f = impuesto.to_f/100
        end
        
        puts "# #{cantidad} * $#{precio} = #{sub_total} "
        puts "#{estado}(#{impuesto}%) = #{sub_total * impuesto_f}" 
        puts "DTO(#{valor_descuento}%) = $#{sub_total * valor_descuento_f}" 
        puts "Total = $#{sub_total + (sub_total * valor_descuento_f) + (sub_total * impuesto_f)}" 
    end
end
 
factura= Factura.new()
factura.facturar(ARGV[0],ARGV[1],ARGV[2])
