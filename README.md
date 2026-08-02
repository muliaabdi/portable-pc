# Portable-PC mode on Android smartphone

Implementation Linux Portable PC on Android Smartphone using native Termux and Termux-X11

[WATCH the complete VIDEO guide](https://www.youtube.com/watch?v=JEyhuMbY_68)

<img width="1920" height="1080" alt="A_0005C780A260731_22401554_CANON-f003181" src="https://github.com/user-attachments/assets/29af7d26-0a21-4fc3-b74e-ab85377b82a2" />
<img width="1920" height="1080" alt="A_0005C763A260731_180005IE_CANON-f005701" src="https://github.com/user-attachments/assets/d78609a7-135a-46fd-a7d4-a3d825b76e43" />


Step by step guide:

1. Download and install F-Droid from https://f-droid.org/
2. Download and install Termux from F-Droid
3. Download and install Termux-X11 from https://github.com/termux/termux-x11/releases
4. Turn off battery saver / battery restriction for Termux and Termux-X11 apps
5. Turn on developer options, then enable "Disable Child Process Restrictions" option
6. Open Termux and Run these list of commands

    ```
    pkg update
    pkg upgrade
    pkg install tur-repo
    pkg install x11-repo
    pkg install termux-x11-nightly
    pkg install pulseaudio
    pkg install wget
    pkg install git
    termux-setup-storage
    ```
7. Install XFCE4
    ```
    pkg install xfce4
    ```
8. Create launcher script
    ```
    nano ~/pc
    
    # Paste launcher.sh script from this repo, save, then run these list of commands
    
    # Make it executable
    chmod +x pc

    # Create alias for easier launch
    nano ~/.bashrc

    # then add this alias, and save
    alias pc="~/pc"

    # reload configuration
    source ~/.bashrc
    ```
9. Launch the portable PC desktop from termux

    ```
    pc
    ```

10. Create shutdown shortcut

    ```
    cd ~/Desktop
    nano shutdown.desktop

    # Paste shutdown.shortcut command from this repo, and save
    ```

11. Install apps you need (both from Termux terminal or inside portable PC XFCE4 terminal is okay)

    ```
    # Search available app
    pkg search app-name

    # Install app
    pkg install app-name

===============

Credit to:
- [DroidDesk](https://github.com/orailnoor/DroidDesk) and [LinuxDroidMaster](https://github.com/LinuxDroidMaster), this implementation are inspired from both awesome projects.
- [Termux](https://github.com/termux) and [Termux-X11](https://github.com/termux/termux-x11) developers who made this implementation possible
- [XFCE](https://xfce.org/) as the awesome and light desktop environment used in this implementation project.




