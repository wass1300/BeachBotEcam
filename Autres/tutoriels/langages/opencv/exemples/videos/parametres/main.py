#
# Scripts provenants de labomedia.org, commentés par Alexis Paques
#
import cv2

# Lancer la capture
cap = cv2.VideoCapture(0)
# Définir les paramètres de capture, ici nous mettons "320*240". Nous pourrions choisir 640*480 ou 160*120
cap.set(3,320)
cap.set(4,240)
 
#
# Propriétés accessibles via
# cap.set(PROPERTY,VALUE)
# cap.get(PROPERTY)
#
# CV_CAP_PROP_POS_MSEC Current position of the video file in milliseconds.
# CV_CAP_PROP_POS_FRAMES 0-based index of the frame to be decoded/captured next.
# CV_CAP_PROP_POS_AVI_RATIO Relative position of the video file
# CV_CAP_PROP_FRAME_WIDTH Width of the frames in the video stream.
# CV_CAP_PROP_FRAME_HEIGHT Height of the frames in the video stream.
# CV_CAP_PROP_FPS Frame rate.
# CV_CAP_PROP_FOURCC 4-character code of codec.
# CV_CAP_PROP_FRAME_COUNT Number of frames in the video file.
# CV_CAP_PROP_FORMAT Format of the Mat objects returned by retrieve() .
# CV_CAP_PROP_MODE Backend-specific value indicating the current capture mode.
# CV_CAP_PROP_BRIGHTNESS Brightness of the image (only for cameras).
# CV_CAP_PROP_CONTRAST Contrast of the image (only for cameras).
# CV_CAP_PROP_SATURATION Saturation of the image (only for cameras).
# CV_CAP_PROP_HUE Hue of the image (only for cameras).
# CV_CAP_PROP_GAIN Gain of the image (only for cameras).
# CV_CAP_PROP_EXPOSURE Exposure (only for cameras).
# CV_CAP_PROP_CONVERT_RGB Boolean flags indicating whether images should be converted to RGB.
# CV_CAP_PROP_WHITE_BALANCE Currently unsupported
# CV_CAP_PROP_RECTIFICATION Rectification flag for stereo cameras (note: only supported by DC1394 v 2.x backend currently)