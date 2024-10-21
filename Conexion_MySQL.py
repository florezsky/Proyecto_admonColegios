import pyodbc
import flask;


app = flask.Flask(__name__)

class Departamento:
    id_departamento: int = 0
    nombre: str = None
    
    def GetId(self) -> int:
        return self.id_departamento
    
    def SetId(self, value: int) -> None:
        self.id_departamento = value
    
    def GetNombre(self) -> str:
        return self.nombre
    
    def SetNombre(self, value: str) -> None:
        self.nombre = value

class Colegio:
    id_colegio: int = 0
    nombre: str = None
    direccion: str = None
    telefono: str = None
    id_comuna: int = None
    
    def GetId(self) -> int:
        return self.id_colegio
    
    def SetId(self, value: int) -> None:
        self.id_colegio = value
    
    def GetNombre(self) -> str:
        return self.nombre
    
    def SetNombre(self, value: str) -> None:
        self.nombre = value
    
    def GetDireccion(self) -> str:
        return self.direccion
    
    def SetDireccion(self, value: str) -> None:
        self.direccion = value
    
    def GetTelefono(self) -> str:
        return self.telefono
    
    def SetTelefono(self, value: str) -> None:
        self.telefono = value
    
    def GetComunaId(self) -> int:
        return self.id_comuna
    
    def SetComunaId(self, value: int) -> None:
        self.id_comuna = value

class Director:
    id_director: int = 0
    nombre: str = None
    apellido: str = None
    email: str = None
    id_secretaria: int = None
    
    def GetId(self) -> int:
        return self.id_director
    
    def SetId(self, value: int) -> None:
        self.id_director = value
    
    def GetNombre(self) -> str:
        return self.nombre
    
    def SetNombre(self, value: str) -> None:
        self.nombre = value
    
    def GetApellido(self) -> str:
        return self.apellido
    
    def SetApellido(self, value: str) -> None:
        self.apellido = value
    
    def GetEmail(self) -> str:
        return self.email
    
    def SetEmail(self, value: str) -> None:
        self.email = value
    
    def GetSecretariaId(self) -> int:
        return self.id_secretaria
    
    def SetSecretariaId(self, value: int) -> None:
        self.id_secretaria = value

class SecretariaEducacion:
    id_secretaria: int = 0
    
    def GetId(self) -> int:
        return self.id_secretaria
    def SetId(self, value: int) -> None:
        self.id_secretaria = value

    nombre: str = None
    
    def GetNombre(self) -> str:
        return self.nombre
    def SetNombre(self, value: str) -> None:
        self.nombre = value

    direccion: str = None
    
    def GetDireccion(self) -> str:
        return self.direccion
    def SetDireccion(self, value: str) -> None:
        self.direccion = value

    email: str = None
    
    def GetEmail(self) -> str:
        return self.email
    def SetEmail(self, value: str) -> None:
        self.email = value
    
    id_departamento: int = None
    
    def GetDepartamentoId(self) -> int:
        return self.id_departamento
    def SetDepartamentoId(self, value: int) -> None:
        self.id_departamento = value

    _departamento: Departamento = None
    
    def GetDepartamento(self) -> Departamento:
        return self._departamento
    def SetDepartamento(self, value: Departamento) -> None:
        self._departamento = value

class Comuna:
    def __init__(self, id_comuna: int = None, nombre: str = None):
        self.id_comuna = id_comuna
        self.nombre = nombre

    def GetId(self) -> int:
        return self.id_comuna
    
    def SetId(self, value: int) -> None:
        self.id_comuna = value
    
    def GetNombre(self) -> str:
        return self.nombre
    
    def SetNombre(self, value: str) -> None:
        self.nombre = value

class Conexion:
    strConnection: str = """
        Driver={MySQL ODBC 9.0 Unicode Driver};
        Server=localhost;
        Database=db_colegios;
        PORT=3306;
        user=user_colegios;
        password=Colegios2024"""

    def ConexionSecretarias(self) -> None:
        conexion = pyodbc.connect(self.strConnection)
        consulta: str = """SELECT * FROM SecEducacion_Departamental"""
        cursor = conexion.cursor()
        cursor.execute(consulta)

        lista: list = []
        for elemento in cursor:
            entidad = SecretariaEducacion()
            entidad.SetId(elemento[0])
            entidad.SetNombre(elemento[1])
            entidad.SetDireccion(elemento[2])
            entidad.SetEmail(elemento[3])
            entidad.SetDepartamentoId(elemento[4])
            lista.append(entidad)
            
        cursor.close()
        conexion.close()

        for secretaria in lista:
            print(f"{secretaria.GetId()} - {secretaria.GetNombre()} - {secretaria.GetDireccion()} - {secretaria.GetEmail()} - {secretaria.GetDepartamentoId()}")
    
    
    def ConexionDirectoresByDepartamento(self, departamento_id: int) -> None:
        conexion = pyodbc.connect(self.strConnection)
        consulta: str = "{CALL GetDirectoresByDepartamento(?)}"
        cursor = conexion.cursor()
        cursor.execute(consulta, (departamento_id,))

        lista: list = []
        for elemento in cursor:
            director = Director()
            director.SetId(elemento[0])
            director.SetNombre(elemento[1])
            director.SetApellido(elemento[2])
            director.SetEmail(elemento[3])
            lista.append(director)

        cursor.close()
        conexion.close()

        for director in lista:
            print(f"{director.GetId()} - {director.GetNombre()} {director.GetApellido()} - {director.GetEmail()}")
    
    def ConexionInsertarColegio(self, id_colegio: int, nombre: str, direccion: str, telefono: str, id_comuna: int) -> None:
        try:
            conexion = pyodbc.connect(self.strConnection)
            consulta: str = "{CALL InsertColegio2(?, ?, ?, ?, ?)}"
            cursor = conexion.cursor()
            cursor.execute(consulta, (id_colegio, nombre, direccion, telefono, id_comuna))

            conexion.commit()  
            cursor.close()
            conexion.close()

            print(f"Colegio '{nombre}' insertado correctamente con ID {id_colegio}.")
        except pyodbc.Error as e:
            print(f"Error al insertar el colegio: {e}")
        
    def ConexionActualizarColegio(self, id_colegio_py: int, nueva_direccion: str, nuevo_telefono: str) -> None:
        conexion = pyodbc.connect(self.strConnection)
        consulta: str = "{CALL UpdateColegio(?, ?, ?)}"
        cursor = conexion.cursor()
        cursor.execute(consulta, (id_colegio_py, nueva_direccion, nuevo_telefono))
        
        conexion.commit()  
        cursor.close()
        conexion.close()    
        
        print(f"Colegio con ID {id_colegio_py} actualizado correctamente.")

    def ConexionEliminarDirector(self, id_director: int) -> None:
        conexion = pyodbc.connect(self.strConnection)
        consulta: str = "{CALL DeleteDirector(?)}"
        cursor = conexion.cursor()
        cursor.execute(consulta, (id_director,))
        
        conexion.commit() 
        cursor.close()
        conexion.close()
        
        print(f"Director con ID {id_director} eliminado correctamente.")
        
    def ConexionColegiosCountByDepartamento(self) -> None:
        conexion = pyodbc.connect(self.strConnection)
        consulta: str = "{CALL GetColegiosCountByDepartamento()}"
        cursor = conexion.cursor()
        cursor.execute(consulta)

        lista: list = []
        for elemento in cursor:
            departamento = Departamento()
            departamento.SetId(elemento[0])
            conteo_colegios = elemento[1]
            lista.append((departamento, conteo_colegios))

        cursor.close()
        conexion.close()

        for departamento, conteo in lista:
            print(f"Departamento {departamento.GetId()} tiene {conteo} colegios.")


        
        
conexion: Conexion = Conexion()
#conexion.ConexionSecretarias()
#conexion.ConexionDirectoresByDepartamento(1)
#conexion.ConexionInsertarColegio(102, 'Colegio Nuevo2', 'Calle 321', '123456312', 2)
#conexion.ConexionActualizarColegio(2, 'Nueva Calle 923923', '125232')


