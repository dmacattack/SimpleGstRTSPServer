all:
	gcc test-launch.c \
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

clean:
	rm testLaunch

run:
	# Im lazy...
	./testLaunch "videotestsrc ! video/x-raw,width=1280,height=720 ! timeoverlay ! x264enc ! rtph264pay name=pay0 pt=96"
