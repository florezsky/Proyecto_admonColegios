import pyodbc;
from datetime import datetime;


class Departamento:
   
    ID_Departamento: int = 0
   
    def GetID_Departamento(self) -> int:
        return self.ID_Departamento
   
    def setID_Departamento(self, value: int) -> None:
        self.ID_Departamento = value
   
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
        
        
class SecEducacion_Departamental:
   
    ID_Secretaria: int = 0
     
    def GetID_Secretaria(self) -> int:
        return self.ID_Secretaria
   
    def SetID_Secretaria(self, value: int) -> None:
        self.ID_Secretaria = value
       
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Direccion: str = None
       
        def GetDireccion(self) -> str:
        return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
        
    Email: str = None
      
      def GetEmail(self) -> str:
        return self.Email
   
    def SetEmail(self, value: str) -> None:
        self.Email = value
      
    ID_Departamento: int = 0
      
    def GetID_Departamento(self) -> int:
        return self.ID_Departamento
   
    def SetID_Departamento(self, value: int) -> None:
        self.ID_Departamento = value 
        
        
class DirSecretaria_Educacion:
       
    ID_Director: int = 0
       
    def GetID_Director(self) -> int:
        return self.ID_Director
   
    def SetID_Director(self, value: int) -> None:
        self.ID_Director = value
       
       
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Apellido: str = None
       
       def GetApellido(self) -> str:
        return self.Apellido
   
    def SetApellido(self, value: str) -> None:
        self.Apellido = value
        
    Genero: str = None
       
       def GetGenero(self) -> str:
        return self.Genero
   
    def SetGenero(self, value: str) -> None:
        self.Genero = value
       
    Email: str = None
      
      def GetEmail(self) -> str:
        return self.Email
   
    def SetEmail(self, value: str) -> None:
        self.Email = value
       
    Direccion: str = None
       
       def GetDireccion(self) -> str:
        return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
       
    Fecha_contratación: = datetime
     
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
   
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
       
    Fecha_Nacimiento: = datetime
       
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
   
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value
        
    ID_Secretaria: int = 0
     
    def GetID_Secretaria(self) -> int:
        return self.ID_Secretaria
   
    def SetID_Secretaria(self, value: int) -> None:
        self.ID_Secretaria = value
        
class  Regional:   
    
    ID_Regional: int = 0
     
    def GetID_Regional(self) -> int:
        return self.ID_Regional
   
    def SetID_Regional(self, value: int) -> None:
        self.ID_Regional = value
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
        
    ID_Departamento: int = 0
      
    def GetID_Departamento(self) -> int:
        return self.ID_Departamento
   
    def SetID_Departamento(self, value: int) -> None:
        self.ID_Departamento = value 
       
class Dir_Regional:
    
    ID_DirRegional: int = 0
     
    def GetID_DirRegional(self) -> int:
        return self.ID_DirRegional
   
    def SetID_DirRegional(self, value: int) -> None:
        self.ID_DirRegional = value
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Apellido: str = None
       
       def GetApellido(self) -> str:
        return self.Apellido
   
    def SetApellido(self, value: str) -> None:
        self.Apellido = value
        
    Genero: str = None
       
    def GetGenero(self) -> str:
        return self.Genero
   
    def SetGenero(self, value: str) -> None:
        self.Genero = value
       
    Email: str = None
      
    def GetEmail(self) -> str:
        return self.Email
   
    def SetEmail(self, value: str) -> None:
        self.Email = value
        
    Direccion: str = None
       
    def GetDireccion(self) -> str:
      return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
       
    Fecha_contratación: = datetime
     
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
   
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
       
    Fecha_Nacimiento: = datetime
       
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
   
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value   
       
    ID_Regional: int = 0
     
    def GetID_Regional(self) -> int:
        return self.ID_Regional
   
    def SetID_Regional(self, value: int) -> None:
        self.ID_Regional = value
    
class Ciudad:
    
    ID_Ciudad: int = 0
    
    def GetID_Ciudad(self) -> int:
        return self.ID_Ciudad
   
    def SetID_Ciudad(self, value: int) -> None:
        self.ID_Ciudad = value
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
      
    ID_Regional: int = 0
     
    def GetID_Regional(self) -> int:
        return self.ID_Regional
   
    def SetID_Regional(self, value: int) -> None:
        self.ID_Regional = value 
        
class Comuna:
    
    ID_Comuna: int = 0
    
    def GetID_Comuna(self) -> int:
        return self.ID_Comuna
   
    def SetID_Comuna(self, value: int) -> None:
        self.ID_Comuna = value 
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
        
    ID_Ciudad: int = 0
    
    def GetID_Ciudad(self) -> int:
        return self.ID_Ciudad
   
    def SetID_Ciudad(self, value: int) -> None:
        self.ID_Ciudad = value                  
            
class Director_Comuna:
    
    ID_Director: int = 0
       
    def GetID_Director(self) -> int:
        return self.ID_Director
   
    def SetID_Director(self, value: int) -> None:
        self.ID_Director = value 
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Apellido: str = None
       
    def GetApellido(self) -> str:
        return self.Apellido
   
    def SetApellido(self, value: str) -> None:
        self.Apellido = value
        
    Genero: str = None
       
    def GetGenero(self) -> str:
        return self.Genero
   
    def SetGenero(self, value: str) -> None:
        self.Genero = value
       
    Email: str = None
      
    def GetEmail(self) -> str:
        return self.Email
   
    def SetEmail(self, value: str) -> None:
        self.Email = value
        
    Direccion: str = None
       
    def GetDireccion(self) -> str:
        return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
       
    Fecha_contratación: = datetime
     
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
   
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
       
    Fecha_Nacimiento: = datetime
       
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
   
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value   
     
    ID_Comuna: int = 0
    
    def GetID_Comuna(self) -> int:
        return self.ID_Comuna
   
    def SetID_Comuna(self, value: int) -> None:
        self.ID_Comuna = value 
           
class Colegio:
    
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
   
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
        
    Direccion: str = None
   
    def GetDireccion(self) -> str:
        return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
      
    Telefono: str = None
   
    def GetTelefono(self) -> str:
        return self.Telefono
   
    def SetTelefono(self, value: str) -> None:
        self.Telefono = value    
      
    ID_Comuna: int = 0
    
    def GetID_Comuna(self) -> int:
        return self.ID_Comuna
   
    def SetID_Comuna(self, value: int) -> None:
        self.ID_Comuna = value             

class Rector:
    
    ID_Rector: int = 0
       
    def GetID_Rector(self) -> int:
        return self.ID_Rector
   
    def SetID_Rector(self, value: int) -> None:
        self.ID_Rector = value
       
       
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Apellido: str = None
       
    def GetApellido(self) -> str:
        return self.Apellido
   
    def SetApellido(self, value: str) -> None:
        self.Apellido = value
        
    Genero: str = None
       
    def GetGenero(self) -> str:
        return self.Genero
   
    def SetGenero(self, value: str) -> None:
        self.Genero = value
       
    Email: str = None
      
    def GetEmail(self) -> str:
        return self.Email
   
    def SetEmail(self, value: str) -> None:
        self.Email = value
       
    Direccion: str = None
       
    def GetDireccion(self) -> str:
        return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
       
    Fecha_contratación: = datetime
     
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
   
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
       
    Fecha_Nacimiento: = datetime
       
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
   
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value
                   
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
   
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value
        
        
class Secretaria_Colegio:
    
    ID_Secretaria: int = 0
    
    def GetID_Secretaria(self) -> int:
        return self.ID_Secretaria
   
    def SetID_Secretaria(self, value: int) -> None:
        self.ID_Secretaria = value
    
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Apellido: str = None
       
    def GetApellido(self) -> str:
        return self.Apellido
   
    def SetApellido(self, value: str) -> None:
        self.Apellido = value
        
    Genero: str = None
       
    def GetGenero(self) -> str:
        return self.Genero
   
    def SetGenero(self, value: str) -> None:
        self.Genero = value
       
    Email: str = None
      
    def GetEmail(self) -> str:
        return self.Email
   
    def SetEmail(self, value: str) -> None:
        self.Email = value
       
    Direccion: str = None
       
    def GetDireccion(self) -> str:
        return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
       
    Fecha_contratación: = datetime
     
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
   
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
       
    Fecha_Nacimiento: = datetime
       
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
   
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value
        
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
   
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value
        
class Profesor:
    
    ID_Profesor: int = 0
    
    def GetID_Profesor(self) -> int:
        return self.ID_Profesor
   
    def SetID_Profesor(self, value: int) -> None:
        self.ID_Profesor = value
    
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Apellido: str = None
       
    def GetApellido(self) -> str:
        return self.Apellido
   
    def SetApellido(self, value: str) -> None:
        self.Apellido = value
        
    Genero: str = None
       
    def GetGenero(self) -> str:
        return self.Genero
   
    def SetGenero(self, value: str) -> None:
        self.Genero = value
       
    Email: str = None
      
    def GetEmail(self) -> str:
        return self.Email
   
    def SetEmail(self, value: str) -> None:
        self.Email = value
       
    Direccion: str = None
       
    def GetDireccion(self) -> str:
        return self.Direccion
   
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value
       
    Fecha_Nacimiento: = datetime
       
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
   
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value
        
    Titulo: str = None
       
    def GetTitulo(self) -> str:
        return self.Titulo
   
    def SetTitulo(self, value: str) -> None:
        self.Titulo = value    
        
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
   
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value
                 
class Profesor_Colegio:
          
    ID_Profesor: int = 0
    
    def GetID_Profesor(self) -> int:
        return self.ID_Profesor
   
    def SetID_Profesor(self, value: int) -> None:
        self.ID_Profesor = value  
        
    Fecha_contratación: = datetime
     
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
   
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value 
              
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
   
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value
        
class Curso:
          
    ID_Curso: int = 0
    
    def GetID_Curso(self) -> int:
        return self.ID_Curso
   
    def SetID_Curso(self, value: int) -> None:
        self.ID_Curso = value   
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
        
        
    Num_Estudiantes: int = 0
    
    def GetNum_Estudiantes(self) -> int:
        return self.Num_Estudiantes
   
    def SetNum_Estudiantes(self, value: int) -> None:
        self.Num_Estudiantes = value
        
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
   
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value            
        
        
class Asignatura:
    
    ID_Asignatura: int = 0
    
    def GetID_Asignatura(self) -> int:
        return self.ID_Asignatura
   
    def SetID_CAsignatura(self, value: int) -> None:
        self.ID_Asignatura = value   
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
        
    ID_Curso: int = 0
    
    def GetID_Curso(self) -> int:
        return self.ID_Curso
   
    def SetID_Curso(self, value: int) -> None:
        self.ID_Curso = value 
        
class Profesor_Asignatura:
    
    ID_Profesor: int = 0
    
    def GetID_Profesor(self) -> int:
        return self.ID_Profesor
   
    def SetID_Profesor(self, value: int) -> None:
        self.ID_Profesor = value   
        
    ID_Asignatura: int = 0
    
    def GetID_Asignatura(self) -> int:
        return self.ID_Asignatura
   
    def SetID_CAsignatura(self, value: int) -> None:
        self.ID_Asignatura = value   
       
    Fecha_contratación: = datetime
     
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
   
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value                 
    
class Estudiante:
    
    ID_Estudiante: int = 0
    
    def GetID_Estudiante(self) -> int:
        return self.ID_Estudiante
   
    def SetID_Estudiante(self, value: int) -> None:
        self.ID_Estudiante = value 
        
    Nombre: str = None
   
    def GetNombre(self) -> str:
        return self.Nombre
   
    def SetNombre(self, value: str) -> None:
        self.Nombre = value
     
    Apellido: str = None
       
    def GetApellido(self) -> str:
        return self.Apellido
   
    def SetApellido(self, value: str) -> None:
        self.Apellido = value
        
    Fecha_Nacimiento: = datetime
       
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
   
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value    
        
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
   
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value 
        
class Estudiante_Asignatura:
    
     ID_Estudiante: int = 0
    
    def GetID_Estudiante(self) -> int:
        return self.ID_Estudiante
   
    def SetID_Estudiante(self, value: int) -> None:
        self.ID_Estudiante = value        
        
    ID_Asignatura: int = 0
    
    def GetID_Asignatura(self) -> int:
        return self.ID_Asignatura
   
    def SetID_CAsignatura(self, value: int) -> None:
        self.ID_Asignatura = value
        
    Fecha_matricula: = datetime
       
    def GetFecha_matricula(self) -> datetime:
        return self.Fecha_matricula
   
    def SetFecha_matricula(self, value: datetime) -> None:
        self.Fecha_matricula = value
        
            
                          
class Conexion: 
    string_conexion: str = """
    Driver={MySQL ODBC 9.0 Unicode Driver};
    Server=localhost;
    Database=db_colegios;
    PORT=3306;
    UID=user_colegios; 
    PWD=Colegios2024;      
    """
    
    