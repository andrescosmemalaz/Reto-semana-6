import pymysql
 
class Conexion:

    def __init__(self):
        host = 'localhost'
        username = 'root'
        password = 'admin'
        database = 'tienda'
        self.db = pymysql.connect(host, username, password, database)
        self.cursor = self.db.cursor()
 
    def ejecutar_query(self, query):
        self.cursor.execute(query)
        self.commit()
        return self.cursor

    def commit(self):
        self.db.commit()
        
    def rollback(self):
        self.db.rollback()