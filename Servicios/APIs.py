from Repositorio.Conexion_BD import Conexion
import flask;
import sys;
import binascii;
import os;
from flask_jwt_extended import (
    JWTManager,
    create_access_token,
    jwt_required,
    get_jwt_identity
)
from Crypto.Cipher import AES
class EncriptarAES1:
    secretKey = os.urandom(32)

    def Encriptar(self, valor: str) -> tuple:
        """
        Encripta un valor usando AES en modo GCM.
        """
        aesCipher = AES.new(self.secretKey, AES.MODE_GCM)
        ciphertext, authTag = aesCipher.encrypt_and_digest(str.encode(valor))
        print(f"Texto claro: {valor}")
        print(f"Texto cifrado: {binascii.hexlify(ciphertext).decode()}")
        return (ciphertext, aesCipher.nonce, authTag)

    def Descifrar(self, valor: tuple) -> str:
        """
        Desencripta un valor previamente encriptado con AES en modo GCM.
        """
        (ciphertext, nonce, authTag) = valor
        aesCipher = AES.new(self.secretKey, AES.MODE_GCM, nonce)
        plaintext = aesCipher.decrypt_and_verify(ciphertext, authTag)
        return plaintext.decode()
    
aes_instance = EncriptarAES1()
app = flask.Flask(__name__)
app.config['JWT_SECRET_KEY'] = 'KJhisdy878779ghdfgh45645634564356'  
jwt = JWTManager(app)

USERS_DB = {
    "admin": aes_instance.Encriptar("12345"),
    "user1": aes_instance.Encriptar("12345")
}

@app.route('/login', methods=['POST'])
def login():
    """
    Endpoint para autenticar usuarios y generar un token JWT.
    """
    data = flask.request.get_json()

    if not data or 'username' not in data or 'password' not in data:
        return flask.jsonify({"msg": "Faltan parámetros"}), 400

    username = data['username']
    password = data['password']

    # Validar usuario
    if username not in USERS_DB or aes_instance.Descifrar(USERS_DB[username]) != password:
        return flask.jsonify({"msg": "Usuario o contraseña incorrectos"}), 401

    # Generar token
    access_token = create_access_token(identity=username)
    return flask.jsonify(access_token=access_token), 200 
# http://localhost:4040/main3/CargarDatos/{}
@app.route('/main3/CargarDatos/<string:entrada>', methods=["GET"]) # methods=["POST"]
@jwt_required()
def SELECT(entrada: str) -> str :
    Datos  = {};
    try:
        current_user = get_jwt_identity()
        print(f"Usuario autenticado: {current_user}")
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