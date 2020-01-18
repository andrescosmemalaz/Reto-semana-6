from conexion import Conexion

class Detalle:
    def __init__(self):
        self.conexion = Conexion()
    
    def listar(self, idFactura):
        query = f"select d.idFactura, p.nombreProducto, d.cantidadProducto from detalle d inner join producto p on d.idProducto = p.idProducto where idFactura = '{idFactura}'"
        resultado = self.conexion.ejecutar_query(query)
        filas = resultado.fetchall()
        print(filas)
