# SimpleGstRTSPServer
Simplified RTSP server build and install for Ubuntu system. Rather than go through the complicated process of building everything from source, but you need a simple RTSP server this is my solution.

## Required packages
It is assumed you have gstreamer installed already

Install the rtspserver libraries
```bash
$ sudo apt-get install gir1.2-gst-rtsp-server-1.0 libgstrtspserver-1.0-0 libgstrtspserver-1.0-0-dbg libgstrtspserver-1.0-dev libgstrtspserver-1.0-doc
```

package references:
https://packages.ubuntu.com/xenial/libs/libgstrtspserver-1.0-0
or
https://packages.ubuntu.com/xenial/libdevel/libgstrtspserver-1.0-dev

## Download the test-launch.c from the gst-rtsp-server github 
Optional. You can use the one I downloaded
```bash
$ wget https://raw.githubusercontent.com/GStreamer/gst-rtsp-server/master/examples/test-launch.c
```

## Compile

Use the makefile
```bash
$ make
```

or compile with gcc directly
```bash
$ gcc test-launch.c \
-L/usr/lib/x86_64-linux-gnu \
-lgstrtspserver-1.0 \
-lgstreamer-1.0 \
-lgobject-2.0 \
-lglib-2.0 \
-I/usr/include/gstreamer-1.0 \
-I/usr/include/glib-2.0 \
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include \
-I/usr/lib/x86_64-linux-gnu/gstreamer-1.0/include \
-o testLaunch
```

## Run the Server 
A time overlay is added. This is optional
```bash
$ ./testLaunch "videotestsrc ! video/x-raw,width=1280,height=720 ! timeoverlay ! x264enc ! rtph264pay name=pay0 pt=96"
```

## Run a Client
Run the client locally (127.0.0.1) or from another PC using the Server's IP address
```bash
$ gst-launch-1.0 rtspsrc location=rtsp://127.0.0.1:8554/test latency=50 ! decodebin ! autovideosink
```

