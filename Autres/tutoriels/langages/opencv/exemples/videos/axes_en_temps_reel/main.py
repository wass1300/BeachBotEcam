#
# Scripts provenants de labomedia.org, commentés par Alexis Paques
#
import cv2
 
# Lancement de la capture vidéo
cap = cv2.VideoCapture(0)
 
# "Lecture" de la capture
ret,im = cap.read()

# Récupération de la taille du flux capturé
height, width = im.shape[:2]
 
while True:
	# mise à jour du flux
    ret,im = cap.read()
 
    # trait horizontal
    # Le [0, 0, 255] donne la couleur rouge, modèle BVR
    # Pour tout i de 0 à width (range s'occupe de donner de 0 à width)
    for i in range(width):
    	# Remplacer tous les pixels à la moitié de la hauteur de l'image par du rouge
        im[height/2][i] = [0, 0, 255]
 
    # trait vertical
    # Le [255, 0, 0] donne la couleur bleue, modèle BVR
    for i in range(height):
        im[i][width/2] = [255, 0, 0]
 
 	# Visionnage du flux vidéo
    cv2.imshow('video test',im)
    key = cv2.waitKey(10)

    # Ceci est une option LONGUE et NON optimisée
    # => cv2.line(img,  point1,  point2,      couleur,  épaisseur)
	# cv2.line(img, (0, 270), (960, 270), (0, 0, 0), 1)