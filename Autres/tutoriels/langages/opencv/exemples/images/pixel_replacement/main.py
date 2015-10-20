#
# Scripts provenants de labomedia.org, commentés par Alexis Paques
#
import cv2

# Lecture de l'image
image = cv2.imread('3x2.png')

# "Voir" l'image dans le format brut
print im
# Réponse:
# [[[  0   0   0]
#   [  0 255   0]
#   [  0   0   0]]
#  [[  0   0 255]
#   [255 255 255]
#   [255   0   0]]]


# Remplacement du pixel blanc
im[1][1] = [0, 255, 255]
print im

# Écriture de la nouvelle image
cv2.imwrite('resultat.png',im)