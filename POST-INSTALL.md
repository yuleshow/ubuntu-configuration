# Post-install checklist

Things to do manually after `yuleshow-install.sh` finishes. Items are grouped
by area; skip anything that doesn't apply to your machine.

## 1. Reboot / relogin

- Log out and back in (or reboot) so new group membership, PATH entries, and
  GNOME Shell extensions load.
- On X11 only: `Alt+F2`, type `r`, Enter — reloads GNOME Shell without a
  full logout. (Wayland requires a real logout.)

## 2. GNOME Shell

- Open **Extension Manager** and verify these are enabled:
  - User Themes
  - Dash to Dock
  - Blur my Shell
- Apply the shell theme in **GNOME Tweaks → Appearance → Shell** (e.g. WhiteSur).
- In **Settings → Keyboard**, remap any shortcuts you rely on.
- Toggle **Night Light** in **Settings → Displays**.

## 2a. WhiteSur tweaks

The WhiteSur GTK repo is kept at `~/Applications/WhiteSur-gtk-theme/` so you
can re-run its `tweaks.sh` any time — for example after switching Firefox
profiles or reinstalling Dash to Dock:

```bash
cd ~/Applications/WhiteSur-gtk-theme
./tweaks.sh -f        # Firefox Monterey theme (close Firefox first!)
./tweaks.sh -d        # Dash-to-Dock Monterey tweak
./tweaks.sh -F        # Flatpak app theme overrides (needs flatpak installed)
sudo ./tweaks.sh -g   # GDM login-screen theme
```

The installer already runs all four on first install. Heads-up: `-f` fails if
Firefox is already running, and `-F` is skipped if Flatpak isn't installed
yet — rerun them manually after closing Firefox / after `yuleshow-flatpak.sh`.

Move window titlebar buttons to the left (macOS-style):

```bash
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
```

## 3. Input methods / language

- Open **Settings → Region & Language → Manage Installed Languages**, click
  "Install / Remove Languages…" if the dialog prompts.
- Configure **fcitx5** or **ibus** (whichever was installed) and add the
  zh-Hant / zh-Hans input methods you want.
- Log out and back in so the input-method daemon starts cleanly.

## 4. Browsers

- **Google Chrome / Microsoft Edge**: sign in, enable sync, restore extensions.
- **Tor Browser** lives in `~/Applications/tor-browser/`; launch it once so it
  registers a desktop entry, then pin to the dock.

## 5. Sync / cloud clients

- **InSync**: launch, sign in to Google Drive / OneDrive / Dropbox, pick the
  base folder (typically `~/Insync`).
- **Resilio Sync** (if installed via `yuleshow-ebook.sh`): open
  <http://localhost:8888>, create identity, link folders.

## 6. SmartGit

- Accept the license (non-commercial or paid).
- Point it at your SSH key (`~/.ssh/id_ed25519`) and import repositories.

## 7. VS Code

- Sign in with GitHub to enable Settings Sync.
- Install the extensions you rely on (Copilot, Python, etc.).

## 8. Gopeed

- Open Gopeed, set the default download folder, and install the browser
  extension (Chrome / Edge) from the store.

## 9. Emacs

- First launch will byte-compile packages; let it finish before quitting.
- If you use a private config, clone it into `~/.emacs.d/` or `~/.config/emacs/`.

## 10. GoldenDict

- The base app is installed by `yuleshow-goldendict.sh` (run by the main
  installer). The bundled dictionaries are a separate, opt-in download —
  they're large (~2 GB split into many `.partaa` .. `.partzz` chunks) so
  they are **not** part of `yuleshow-install.sh`.
- To fetch them, run the dedicated batch script on its own:
  ```bash
  cd ~/ubuntu-configuration/batch
  ./yuleshow-goldendict-get-dicts.sh
  ```
  then concatenate + extract (`cat goldendict-dicts.tar.gz.part* | tar -xz`).
- In **GoldenDict → Edit → Dictionaries → Sources**, point it at the extracted
  folder.

## 11. VirtualBox

- Add your user to the `vboxusers` group (the installer already does this;
  logout required for it to take effect):
  ```
  groups | grep vboxusers
  ```
- Install the **Extension Pack** matching the VirtualBox version from
  <https://www.virtualbox.org/wiki/Downloads>.

## 12. iPhone / libimobiledevice

- Plug in the phone, tap **Trust this computer** on the device.
- `ifuse ~/iPhone` mounts the Camera Roll; `fusermount -u ~/iPhone` to unmount.

## 13. Calibre / ebook tools

- Launch Calibre once to create the library folder.
- If you use DeDRM, install the plugin manually (it's not bundled for
  licensing reasons).

## 14. Audio / video

- In **pavucontrol**, set the correct default output / input device.
- Test **OBS** / **HandBrake** / **Audacity** if you plan to use them.

## 15. Shell / dotfiles

  (`reset_usb`, etc.); move them to `~/.bash_aliases` if you prefer.
- If you use zsh, run `chsh -s $(which zsh)` and install your framework
  (oh-my-zsh / starship / etc.) — the installer does not touch zsh.

## 16. Clean up

- Empty `~/Downloads` of leftover `.deb` / `.tar.xz` files that batch scripts
  may have missed.
- Review the install log at `~/yuleshow-install-YYYYMMDD-HHMMSS.log` and the
  summary `.summary.log` for any `[FAIL]` entries; rerun those batch scripts
  individually from `~/ubuntu-configuration/batch/`.

## 17. Optional, disabled by default

These batches are commented out in `yuleshow-install.sh` — uncomment the
corresponding `run` line and re-run the installer if you want them:

- `yuleshow-aria2.sh` — aria2 + BaiduExporter RPC setup
- `yuleshow-teamviewer.sh`
- `yuleshow-wechat.sh`
- `yuleshow-whitesur.sh` — full WhiteSur GTK + icon theme stack
- `yuleshow-dupeguru.sh`
- `yuleshow-crossover.sh`
- `yuleshow-freefilesync.sh`
