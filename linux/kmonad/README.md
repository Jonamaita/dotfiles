# KMonad

KMonad is a keyboard manager similar to interception tools (as in, they work the same way). It "grabs" your keyboard input and transforms it.

I bind my keyboard to avoid using the arrow keys (up, down, right, and left). Instead, I use `space` + `h`/`j`/`k`/`l` for arrows, and other keys like `tab` instead of `Escape`.

In short, if someday I don't remember what this folder is for (because this process isn't automated yet), here's what I need to do:

1.  **Install KMonad**. For Ubuntu (for now), you have to download the binary package and move it to `/usr/bin/`.
2.  **Create** a new folder named `kmonad` in your `/etc/` directory.
3.  **Copy** `./drop_alt.kbd` to `/etc/kmonad/drop_alt.kbd`.
4.  **Change** `/etc/kmonad/config.kbd` to reflect what my current keyboard's `/dev/input` file is. I wish it was easier to identify; here are some guidelines:

    * `ls -l /dev/input/by-id` is easier than `/dev/input/by-path`, because the ID should never change, at least for the `drop_alt` keyboard.
    * If you fail to find it by ID, try using the path.
    * Still nothing? Then try looking directly in `/dev/input`. Files should be in the `eventX` format, where X is an integer.

5.  **Create a service** to run KMonad more easily. Copy `kmonad@.service` to `/etc/systemd/system/kmonad@.service`.
6.  **Run KMonad** with the init system: `systemctl start kmonad@drop_alt`.

> **Note:** If you restart your system, you will need to run the command `systemctl start kmonad@drop_alt` again for every keyboard you want to bind.
