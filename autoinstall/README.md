# Autoinstall files for Ubuntu 24.04 LTS (noble)

This folder contains a [subiquity / cloud-init autoinstall](https://canonical-subiquity.readthedocs-hosted.com/en/latest/intro-to-autoinstall.html)
configuration that turns the Ubuntu 24.04 Server ISO into an unattended installer
that finishes with the full **yuleshow/ubuntu-configuration** post-install stack.

## Files

| File | Purpose |
| --- | --- |
| `user-data` | The autoinstall payload (cloud-config) |
| `meta-data` | Required companion (can stay empty-ish) |

## Before you use it

1. **Generate your password hash** and replace the `password:` string in
   `user-data`:

   ```bash
   mkpasswd -m sha-512
   ```

2. **(Optional) Paste the Albert OBS signing key** into the
   `home-manuelschneid3r.list` source block, or remove that block and the
   `albert` line from `packages:` if you don't need it.

3. **Review the `storage:` block.** The default wipes the first disk and uses
   LVM over the whole device.

4. **Put your SSH public key** into the `ssh.authorized-keys:` list if you want
   passwordless login.

## Boot methods

### A. Serve over HTTP (easiest for VMs)

```bash
cd autoinstall
python3 -m http.server 3003
```

Boot the 24.04 server ISO with extra kernel args:

```
autoinstall ds=nocloud-net;s=http://<host-ip>:3003/
```

### B. Bake into an ISO

Use [`cubic`](https://launchpad.net/cubic) or `xorriso`:

```bash
mkdir -p ISO/server/nocloud
cp user-data meta-data ISO/server/nocloud/
# …then regenerate the ISO and add `autoinstall ds=nocloud;s=/cdrom/server/nocloud/`
# to the GRUB boot entry
```

### C. Cloud-init on an existing VM

For testing, on an already-running 24.04 machine:

```bash
sudo cloud-init clean --logs
sudo cp user-data /var/lib/cloud/seed/nocloud-net/user-data
sudo cp meta-data /var/lib/cloud/seed/nocloud-net/meta-data
sudo cloud-init init --local
```

## What happens on first boot

After the installer reboots the new system, a one-shot
`yuleshow-firstboot.service` (created by `late-commands:`) runs as the
`yuleshow` user and executes:

```bash
cd ~ && bash ubuntu-configuration/yuleshow-install.sh
```

…which in turn runs all the `batch/yuleshow-*.sh` scripts (Chrome/Opera repos,
VirtualBox, Calibre, Telegram, SmartGit snap, GoldenDict, iPhone stack, etc.).

Progress is written to `~/yuleshow-install.log` and the service marks itself
complete by creating `/var/lib/yuleshow-firstboot.done` so it never re-runs.
