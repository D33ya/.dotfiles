import subprocess
import platform
import sys

packages = {
        "apt": ["kitty", "yazi", "thunderbird"],
        }
flatpak = ["brave", "discord"]

def set_pkg_mgr() -> str:
    distro = platform.freedesktop_os_release()

    match distro.get("ID"):
        case "pop" | "ubuntu" | "debian":
            return "apt"

        case "arch":
            return "pacman"

        case "fedora":
            return "dnf"

        case "opensuse":
            return "zypper"
        
        case _:
            raise Exception(f"Unknown distro: {distro.get('ID')}")


def main():
    pkg_mgr = set_pkg_mgr()

    install_packages = packages.get(pkg_mgr)

    print(install_packages)

    subprocess.run(["sudo", "apt", "update"])

    subprocess.run(["sudo", "apt", "upgrade"])

    subprocess.run(["sudo", pkg_mgr, "install", install_packages[0:]])

if __name__ == "__main__":
    main()
