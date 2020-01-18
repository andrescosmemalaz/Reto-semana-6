from conexion import Conexion 

class Factura:
    def __init__(self):
        self.conexion = Conexion()
    
    def listar(self, fechaFactura):
        query = f"select f.idFactura, f.fechaFactura, c.nombreCliente from factura f inner join cliente c on f.idCliente = c.idCliente where f.fechaFactura = '{fechaFactura}' "
        resultado = self.conexion.ejecutar_query(query)
        filas = resultado.fetchall()
        print(filas)
