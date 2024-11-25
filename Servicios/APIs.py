from Repositorio.Conexion_BD import Conexion
import flask;
import sys;

app = flask.Flask(__name__)
               
# http://localhost:4040/main3/CargarPersonas/{}
@app.route('/main3/CargarPersonas/<string:entrada>', methods=["GET"]) # methods=["POST"]
def SELECT(entrada: str) -> str :
    Datos  = {};
    try:
        conexion: Conexion = Conexion();
        Datos ["Departamentos"] = conexion.SeleccionarDepartamento();
        Datos ["SecEducacion_Departamental"] = conexion.Seleccionar_SecEducacion_Departamental();
        Datos ["DirSecretaria_Educacion"] = conexion.Seleccionar_DirSecretaria_Educacion();
        Datos ["Regional"] = conexion.Seleccionar_Regional();
        Datos ["DirRegional"] = conexion.Seleccionar_DirRegional();
        Datos ["Ciudad"] = conexion.Seleccionar_Ciudad();
        Datos ["Comuna"] = conexion.Seleccionar_Comuna();
        Datos ["DirComuna"] = conexion.Seleccionar_DirComuna();
        Datos ["Colegio"] = conexion.Seleccionar_Colegio();
        Datos ["Response"] = "Ok";
        return flask.jsonify(Datos );
    except:
        Datos ["Send"] = sys.exc_info();
        return flask.jsonify(Datos );    
