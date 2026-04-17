sudo apt install fonts-symbola -y
# Intel Graphics Update Tool was discontinued by Intel in 2019.
# On Ubuntu 24.04 (noble), the in-kernel i915/Xe drivers are current; no extra package needed.
# For the latest Intel compute/media stack, enable the Intel graphics PPA instead:
#   sudo add-apt-repository -y ppa:kisak/kisak-mesa
#   sudo apt update && sudo apt upgrade -y
