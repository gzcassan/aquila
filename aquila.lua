aquila_global = {
        videocap = {
                type = "usbcam",
                device = "/dev/video0",
                format = "YUV422P",
                width = 640,
                height = 480,
        },
        audiocap = {
                type = "alsa",
        },

        vencode = {
                --type supported: mjpeg/x264
                --type = "mjpeg",
                type = "x264",
        },

        vdecode = {
                type = "h264dec",
        },

        overlay = {
                type = "timestamp",
                offsetx = 0,
                offsety = 0,
                switch = "on",
        },

        playback = {
                -- type supported sdl/snkfake
                --type = "snkfake",
                --format = "file",
                type = "sdl",
                --format = "rgb",
                format = "yuv",
                width = 640,
                height = 480,
        },

        upstream = {
                type = "rtmp",
		url = "rtmp://localhost/live",
        },


        filters = {
                "videocap",
                "vencode",
                "upstream",
        },

        graphs = {
                {
                        source = "videocap",
                        sink = "vencode",
                },
                {
                        source = "vencode",
                        sink = "upstream",
                },
        },
}

return aquila_global
