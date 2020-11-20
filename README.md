Docker alpine - x11vnc - chromium kiosk mode - for use with Guacamole VNC remote desktop

```
docker run -p 5902:5900 -e X11_W=1920 -e X11_H=1080 -e URL=http://192.168.1.4:1176
```


Based on https://github.com/UrielCh/chrome-vnc from Uriel Chemouni 