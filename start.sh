#!/bin/env bash

gst-launch-1.0 \
  glvideomixer name=mixer_overlay sink_0::zorder=1 sink_1::zorder=0 sink_0::alpha=1.0 sink_1::alpha=1.0 ! gldownload ! videoconvert ! kmssink connector-id=77 \
  wpesrc location="http://localhost:3000" name=wpesrc draw-background=0 ! queue ! mixer_overlay. \
  glvideomixer sink_0::zorder=0 sink_1::zorder=1 sink_1::xpos=1296 sink_1::ypos=728 name=m ! queue ! mixer_overlay. \
  v4l2src device=/dev/video10 ! queue ! videoconvert ! glupload ! queue ! m.sink_0 \
  v4l2src device=/dev/video11 ! videoconvert ! glupload \
  ! gltransformation scale-y=1.0 scale-x=1.0 \
  ! queue ! m.sink_1
