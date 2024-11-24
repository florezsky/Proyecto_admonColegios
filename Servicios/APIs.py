from Repositorio.Conexion_BD import Conexion
import flask;
import sys;

app = flask.Flask(__name__)
            
  # http://localhost:4040/main3/CargarPersonas/{}
@app.route('/main3/CargarPersonas/<string:entrada>', methods=["GET"]) # methods=["POST"]
def SeleccionarDepar(entrada: str) -> str :
    Lista_Departamento  = {};
    try:
        conexion: Conexion = Conexion();
        Lista_Departamento ["Departamentos"] = conexion.SeleccionarDepartamento();
        Lista_Departamento ["Response"] = "Ok";
        return flask.jsonify(Lista_Departamento );
    except:
        Lista_Departamento ["Send"] = sys.exc_info();
        return flask.jsonify(Lista_Departamento );    

