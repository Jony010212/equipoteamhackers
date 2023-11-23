import sqlite3
import face_recognition

# Conectar a la base de datos (o crearla si no existe)
conn = sqlite3.connect(
conn = sqlite3.con

conn = s
'reconocimiento_facial.db')
cursor = conn.cursor()


cursor = conn.cur

cursor 
# Crear la tabla de Individuos
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Individuos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        descripcion TEXT
    )
''')

# Crear la tabla de DeteccionesFaciales
cursor.execute('''
    CREATE TABLE IF NOT EXISTS DeteccionesFaciales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        individuo_id INTEGER,
        imagen_path TEXT NOT NULL,
        reconocimiento_exitoso BOOLEAN,
        FOREIGN KEY (individuo_id) REFERENCES Individuos(id)
    )
''')

# Guardar los cambios y cerrar la conexión
conn.commit()
conn.close()


conn.commit()
conn.cl

conn.commit()

conn.
# Resto del código (detección facial)
image = face_recognition.load_image_file(
image = face_recognition.load_image_f

image = face_
"imagen.jpg")
faces = face_recognition.face_locations(image)


faces = face_recognition.face_locations(image)

faces = face_recognition.face_locations(

faces = face_recognition

faces = face_recog

faces 
for face in faces:
    facial_features = face_recognition.face_encodings(image, [face])

    
    facial_features = face_recognition.face_encodings(image, [

    facial_features = face_recognition.face_encodings(

    facial_features = face_recognition.face_encodi

    facial_features = face_recognition.f

    facial_features = face_rec

    facial_features 

    facial
# Conectar nuevamente a la base de datos
    conn = sqlite3.connect(
    conn = sqlit

  
'reconocimiento_facial.db')
    cursor = conn.cursor()

    
    cursor = conn.cursor()

   

    cursor = conn

   
# Insertar un nuevo registro en la tabla DeteccionesFaciales
    cursor.execute(
    cursor
'''
        INSERT INTO DeteccionesFaciales 
            (individuo_id, imagen_path, reconocimiento_exitoso)
        VALUES 
            (NULL, ?, ?)
    ''', ('imagen.jpg', False))

    # Guardar los cambios y cerrar la conexión
    conn.commit()
    conn.close()

    
    conn.commit()
    conn.close()

    conn.commit()
 

    conn.
# Resto del código para comparar con rostros conocidos y realizar acciones según el reconocimiento