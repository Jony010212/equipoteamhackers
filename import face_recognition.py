import face_recognition
import cv2
import matplotlib.pyplot as plt

image = face_recognition.load_image_file("image.jpg")

faces = face_recognition.face_locations(image)


for face in faces:

    facial_features = face_recognition.face_encodings(image, [face])
    
    known_faces = [
        face_recognition.load_image_file("known_face_1.jpg"),
        face_recognition.load_image_file("known_face_2.jpg"),
    ]
    known_face_encodings = [
        face_recognition.face_encodings(img) for img in known_faces
    ]
    match = face_recognition.compare_faces(known_face_encodings, facial_features)
    
    name = "Desconocido"
    if True in match:
        first_match_index = match.index(True)
        name = "Conocido"
    print(f"Rostro detectado: {name}")
    
    top, right, bottom, left = face
    cv2.rectangle(image, (left, top), (right, bottom), (0, 255, 0), 2)
    
    cv2.putText(image, name, (left + 6, bottom - 6), cv2.FONT_HERSHEY_DUPLEX, 0.5, (255, 255, 255), 1)

plt.figure(figsize=(10, 6))
plt.imshow(image)
plt.axis('off')
plt.show()