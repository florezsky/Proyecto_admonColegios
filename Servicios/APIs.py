from Repositorio.Conexion_BD import Conexion
import flask;
import sys;
import datetime;

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


#Table Departamento
# http://localhost:4040/departamento/InsertarDepartamento   
@app.route('/departamento/InsertarDepartamento', methods=["POST"])
def InsertarDepartamentoAPI():
    respuesta = {}
    try:
        # Parsear datos de la solicitud
        datos = flask.request.get_json()

        # Validar datos de entrada
        if not all(k in datos for k in ("id_departamento", "nombre")):
            respuesta["Response"] = "Faltan parámetros en la solicitud."
            return flask.jsonify(respuesta), 400

        # Obtener parámetros
        id_departamento = datos["id_departamento"]
        nombre = datos["nombre"]

        # Llamar a la función InsertarDepartamento
        conexion = Conexion()
        conexion.Insertar_Departamento(id_departamento=id_departamento, nombre=nombre)

        respuesta["Response"] = "Ok"
        respuesta["ID_Departamento"] = id_departamento
        return flask.jsonify(respuesta), 201
    except Exception as e:
        respuesta["Error"] = str(e)
        return flask.jsonify(respuesta), 500
    
   
# http://localhost:4040/departamento/EliminarDepartamento/
@app.route('/departamento/EliminarDepartamento/<int:ID_Departamento>', methods=["DELETE"])
def EliminarEspecieAPI(ID_Departamento):
    respuesta = {}
    try:
        # Llamar a la función Eliminar_Departamento
        conexion = Conexion()
        respuesta = conexion.Eliminar_Departamento(ID_Departamento)

        status_code = 200 if respuesta["Response"] == "Ok" else 404
        return flask.jsonify(respuesta), status_code
    except Exception as e:
        respuesta["Response"] = "Error"
        respuesta["Mensaje"] = str(e)
        return flask.jsonify(respuesta), 500

# http://localhost:4040/departamento/ActualizarDepartamento
@app.route('/departamento/ActualizarDepartamento', methods=["PUT"])
def ActualizarDepartamentoAPI():
    respuesta = {}
    try:
        # Parsear datos de la solicitud
        datos = flask.request.get_json()

        # Validar datos de entrada
        if not all(k in datos for k in ("id", "nombre")):
            respuesta["Response"] = "Faltan parámetros en la solicitud."
            return flask.jsonify(respuesta), 400

        # Convertir datos
        ID_Departamento = int(datos["id"])
      
        # Llamar a la función ActualizarEspecie
        conexion = Conexion()
        respuesta = conexion.Actualizar_Departamento(ID_Departamento, datos["nombre"])

        status_code = 200 if respuesta["Response"] == "Ok" else 404
        return flask.jsonify(respuesta), status_code
    except Exception as e:
        respuesta["Response"] = "Error"
        respuesta["Mensaje"] = str(e)
        return flask.jsonify(respuesta), 500