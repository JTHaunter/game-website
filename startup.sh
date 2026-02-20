#!/bin/bash

# Start virtual display
Xvfb :0 -screen 0 1280x800x24 &

# Start VNC server
x11vnc -display :0 -nopw -forever &

# Start noVNC
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

# Start XFCE
startxfce4 &
