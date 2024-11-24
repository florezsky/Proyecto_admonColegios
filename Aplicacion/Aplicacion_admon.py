import datetime
class Departamento:
    
    def __init__(self):
        self.ID_Departamento = 0  # Valor inicial de ID
        self.Nombre = None  # Valor inicial de Nombre

    def GetId(self) -> int:
        return self.ID_Departamento

    def SetId(self, value: int) -> None:
        self.ID_Departamento = value

    def GetNombre(self) -> str:
        return self.Nombre

    def SetNombre(self, value: str) -> None:
        self.Nombre = value


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


class Rector:
    
    ID_Rector: int = 0
    Nombre: str = None
    Apellido: str = None
    Genero: str = None
    Email: str = None
    Direccion: str = None
    Fecha_contratacion: datetime = None
    Fecha_Nacimiento: datetime = None
    id_Colegio: int = None
    
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
        
    def GetGenero(self) -> str:
        return self.Genero
    
    def SetGenero(self, value: str) -> None:
        self.Genero = value
    
    def GetEmail(self) -> str:
        return self.email
    
    def SetEmail(self, value: str) -> None:
        self.email = value
        
    def GetDireccion(self) -> str:
        return self.Direccion
    
    def SetDireccion(self, value: str) -> None:
        self.Direccion = value   
        
    def GetFecha_Contratacion(self) -> datetime:
        return self.Fecha_Contratacion
    
    def SetFecha_Contratacion(self, value: datetime) -> None:
        self.Fecha_Contratacion = value
        
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
    
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value
    
    def GetId_Colegio(self) -> int:
        return self.id_Colegio
    
    def SetId_Colegio(self, value: int) -> None:
        self.id_Colegio = value


class SecEducacion_Departamental:
    
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
    
    def __init__(self, id_comuna: int = None, nombre: str = None, id_ciudad: int = None):
        self.id_comuna = id_comuna
        self.nombre = nombre
        self.id_ciudad = id_ciudad

    def GetId(self) -> int:
        return self.id_comuna
    
    def SetId(self, value: int) -> None:
        self.id_comuna = value
    
    def GetNombre(self) -> str:
        return self.nombre
    
    def SetNombre(self, value: str) -> None:
        self.nombre = value

    def GetID_Ciudad(self) -> str:
        return self.ID_Ciudad
    
    def SetID_Ciudad(self, value: str) -> None:
        self.ID_Ciudad = value


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
    
    Fecha_contratacion: datetime = None
    
    def GetFecha_contratacion(self) -> datetime:
        return self.Fecha_contratación
    
    def SetFecha_contratacion(self, value: datetime) -> None:
        self.Fecha_contratación = value
    
    Fecha_Nacimiento: datetime = None
    
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
    
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value
        
    ID_Secretaria: int = 0
    
    def GetID_Secretaria(self) -> int:
        return self.ID_Secretaria
    
    def SetID_Secretaria(self, value: int) -> None:
        self.ID_Secretaria = value
        
    _SecretariaEducacion: SecEducacion_Departamental = None
    
    def GetSecEducacion_Departamental(self) -> SecEducacion_Departamental:
        return self._SecretariaEducacion
    
    def SetSecEducacion_Departamental(self, value: SecEducacion_Departamental) -> None:
        self._SecretariaEducacion = value

        
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
        
    ID_Secretaria: int = 0
    
    def GetID_Secretaria(self) -> int:
        return self.ID_Secretaria
    
    def SetID_Secretaria(self, value: int) -> None:
        self.ID_Secretaria = value 
        
    _SecEducacion_Departamental: SecEducacion_Departamental = None
    
    def GetSecEducacion_Departamental(self) -> SecEducacion_Departamental:
        return self._departamento
    
    def SetSecEducacion_Departamental(self, value: Departamento) -> None:
        self._SecEducacion_Departamental = value 

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
    
    Fecha_contratación: datetime = None
    
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
    
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
    
    Fecha_Nacimiento: datetime = None
    
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
    
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value   
    
    ID_Regional: int = 0
    
    def GetID_Regional(self) -> int:
        return self.ID_Regional
    
    def SetID_Regional(self, value: int) -> None:
        self.ID_Regional = value
    
    _Regional: Regional = None
    
    def GetRegional(self) -> Regional:
        return self._departamento
    
    def SetRegional(self, value: Regional) -> None:
        self._Regional = value
    
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
        
    _Regional: Regional = None
    
    def GetRegional(self) -> Regional:
        return self._Regional
    
    def SetRegional(self, value: Regional) -> None:
        self._Regional = value

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
    
    Fecha_contratación: datetime = None
    
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
    
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
    
    Fecha_Nacimiento: datetime = None
    
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
    
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value   

    ID_Comuna: int = 0
    
    def GetID_Comuna(self) -> int:
        return self.ID_Comuna
    
    def SetID_Comuna(self, value: int) -> None:
        self.ID_Comuna = value 
        
    _comunal: Comuna = None
    
    def GetComuna(self) -> Comuna:
        return self._comunal
    
    def SetComuna(self, value: Comuna) -> None:
        self._comunal = value
        
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
    
    Fecha_contratación: datetime = None
    
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
    
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value
    
    Fecha_Nacimiento: datetime = None
    
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
    
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value
        
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
    
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value
        
    _Colegio: Colegio = None
    
    def GetColegio(self) -> Colegio:
        return self._Colegio
    
    def SetColegio(self, value: Colegio) -> None:
        self._Colegio = value

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
    
    Fecha_Nacimiento: datetime = None
    
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
            
    _Colegio: Colegio = None
    
    def GetColegio(self) -> Colegio:
        return self._Colegio
    
    def SetColegio(self, value: Colegio) -> None:
        self._Colegio = value
        
        
class Profesor_Colegio:
    
    ID_Profesor: int = 0
    
    def GetID_Profesor(self) -> int:
        return self.ID_Profesor
    
    def SetID_Profesor(self, value: int) -> None:
        self.ID_Profesor = value  
             
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
    
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value 
        
    Fecha_contratación: datetime = None
    
    def GetFecha_contratación(self) -> datetime:
        return self.Fecha_contratación
    
    def SetFecha_contratación(self, value: datetime) -> None:
        self.Fecha_contratación = value 
        
    _Colegio: Colegio = None
    
    def GetColegio(self) -> Colegio:
        return self._Colegio
    
    def SetColegio(self, value: Colegio) -> None:
        self._Colegio = value
        
        
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
    
    _Colegio: Colegio = None
    
    def GetColegio(self) -> Colegio:
        return self._Colegio
    
    def SetColegio(self, value: Colegio) -> None:
        self._Colegio = value
        
        
class Asignatura:
    
    ID_Asignatura: int = 0
    
    def GetID_Asignatura(self) -> int:
        return self.ID_Asignatura
    
    def SetID_Asignatura(self, value: int) -> None:
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
        
    _Curso: Curso = None
    
    def GetCurso(self) -> Curso:
        return self._Curso
    
    def SetCurso(self, value: Curso) -> None:
        self._Curso = value

class Profesor_Asignatura:
    
    ID_Profesor: int = 0
    
    def GetID_Profesor(self) -> int:
        return self.ID_Profesor
    
    def SetID_Profesor(self, value: int) -> None:
        self.ID_Profesor = value
        
    ID_Asignatura: int = 0
    
    def GetID_Asignatura(self) -> int:
        return self.ID_Asignatura
    
    def SetID_Asignatura(self, value: int) -> None:
        self.ID_Asignatura = value    
        
    fecha_contratacion: datetime = None
    
    def GetFechaContratacion(self) -> datetime:
        return self.fecha_contratacion
    
    def SetFechaContratacion(self, value: datetime) -> None:
        self.fecha_contratacion = value
        
    _Asignatura: Asignatura = None
    
    def GetAsignatura(self) -> Asignatura:
        return self._Asignatura
    
    def SetAsignatura(self, value: Asignatura) -> None:
        self._Asignatura = value   
        
         
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
        
    Fecha_Nacimiento: datetime = None
    
    def GetFecha_Nacimiento(self) -> datetime:
        return self.Fecha_Nacimiento
    
    def SetFecha_Nacimiento(self, value: datetime) -> None:
        self.Fecha_Nacimiento = value    
        
    ID_Colegio: int = 0
    
    def GetID_Colegio(self) -> int:
        return self.ID_Colegio
    
    def SetID_Colegio(self, value: int) -> None:
        self.ID_Colegio = value 
        
    _Colegio: Colegio = None
    
    def GetColegio(self) -> Colegio:
        return self._Colegio
    
    def SetColegio(self, value: Colegio) -> None:
        self._Colegio = value
        
class Estudiante_Asignatura:
    
    ID_Estudiante: int = 0
    
    def GetID_Estudiante(self) -> int:
        return self.ID_Estudiante
    
    def SetID_Estudiante(self, value: int) -> None:
        self.ID_Estudiante = value 
        
    ID_Asignatura: int = 0
    
    def GetID_Asignatura(self) -> int:
        return self.ID_Asignatura
    
    def SetID_Asignatura(self, value: int) -> None:
        self.ID_Asignatura = value       
        
    Fecha_matricula: datetime = None
    
    def GetFecha_matricula(self) -> datetime:
        return self.Fecha_matricula
    
    def SetFecha_matricula(self, value: datetime) -> None:
        self.Fecha_matricula = value 
        
    _Asignatura: Asignatura = None
    
    def GetAsignatura(self) -> Asignatura:
        return self._Asignatura
    
    def SetAsignatura(self, value: Asignatura) -> None:
        self._Asignatura = value 