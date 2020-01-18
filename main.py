from factura import Factura
from detalle_factura import Detalle

print("OPCION 1: Listar facturas según fechaFactura")
print("OPCION 2: Listar productos según idFactura")
print("")
opcion = input("Ingrese una opción: ")

if opcion == "1":
    factura = Factura()
    factura.listar('2020-01-18')
else:
    detalle = Detalle()
    detalle.listar(1)