from Servicios import APIs

# Ahora el servidor Flask de `apis.py` se ejecutará al correr este script
if __name__ == '__main__':
    APIs.app.run(host='localhost', port=4040)
