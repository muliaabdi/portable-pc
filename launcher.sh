#!/data/data/com.termux/files/usr/bin/bash

# ============================================================
# Native Termux XFCE4 Launch Script (No proot)
# Optimized for Samsung Galaxy Tab A9 (1340x800)
# ============================================================

# Kill leftover processes
pkill -9 -f "termux.x11" 2>/dev/null
pkill -9 -f "xfce4-session" 2>/dev/null
pkill -9 -f "pulseaudio" 2>/dev/null
pkill -9 -f "dbus-launch" 2>/dev/null
pkill -9 -f "dbus-daemon" 2>/dev/null

sleep 2

# Clean up stale PID files, sockets, and X11 locks
rm -f /data/data/com.termux/files/usr/var/run/dbus/pid
rm -f "$TMPDIR"/.X0-lock 2>/dev/null
gpgconf --kill gpg-agent 2>/dev/null

# Ensure sdcard symlinks exist
if [ ! -d "$HOME/storage" ]; then
    termux-setup-storage
fi

# Start PulseAudio
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

sleep 1

# Start X server
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null 2>&1 &

sleep 3

# Launch Termux:X11 app
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1

sleep 1

# Set environment variables
export DISPLAY=:0
export PULSE_SERVER=127.0.0.1

# TAB A9 OPTIMIZATIONS (DPI & GPU Workarounds)
xrdb -merge <<< "Xft.dpi: 120"
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export XCURSOR_SIZE=24

export MESA_GL_VERSION_OVERRIDE=3.0
export LIBGL_ALWAYS_SOFTWARE=1
export QTWEBENGINE_DISABLE_GPU=1
export QT_QUICK_BACKEND=software

# FIX DPMS WARNINGS: Matikan fitur DPMS / Sleep Display X11
xset -dpms 2>/dev/null
xset s off 2>/dev/null

# Run XFCE4 Desktop (Sembunyikan log warning systemd/upower yang harmless)
exec dbus-launch --exit-with-session xfce4-session >/dev/null 2>&1
