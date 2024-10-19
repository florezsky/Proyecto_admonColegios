import pyodbc;
from datetime import datetime;

class Conexion: 
    string_conexion: str = """
    Driver={MySQL ODBC 9.0 Unicode Driver};
    Server=localhost;
    Database=db_animales;
    PORT=3306;
    UID=user_animales; 
    PWD=Animal2024;      
    """
    
    