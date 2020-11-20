#!/bin/sh

[ -f /run/secrets/URL ] && URL="$(cat /run/secrets/URL)"
URL="${URL:-https://www.docker.com/}"

if [ ! -z "$EVAL_URL" ]; then URL=$(eval "echo ${URL}"); fi;

rm -rf $HOME/.cache/chromium
rm -rf $HOME/.config/chromium

dbus-uuidgen > /etc/machine-id

# /usr/bin/google-chrome-stable
/usr/bin/chromium-browser ${EXTRA_CHROME_OPTION} \
 --kiosk \
 --no-sandbox \
 --window-size=${X11_W},${X11_H} \
 "${URL}"
