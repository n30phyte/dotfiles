from subprocess import call


def flathub_install(program):
    call(["flatpak", "install", "flathub"] + program)


def dnf(arguments):
    call(["sudo", "dnf"] + arguments)


def dnf_install(packages):
    dnf(["install", "-y"] + packages)


def dnf_remove(packages):
    dnf(["remove", "-y"] + packages)


def dnf_check_update():
    dnf(["-y", "check-update"])


def init():
    # Install RPMFusion Free
    dnf_install(
        "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    )
    dnf_install(
        "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
    )

    # Set up VSCode
    call(
        ["sudo", "rpm", "--import", "https://packages.microsoft.com/keys/microsoft.asc"]
    )
    try:
        file = open("/etc/yum.repos.d/vscode.repo", "w+")
    except IOError:
        print("Error: Failed to open file")

    file.write(
        """[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
"""
    )

    # Enable Chrome
    dnf_install("fedora-workstation-repositories")
    dnf(["config-manager", "--set-enabled", "google-chrome"])

    # Enable dotnet repo
    dnf(["-y", "copr", "enable", "@dotnet-sig/dotnet"])


def install():
    dnf_check_update()
    # Nice looking things
    dnf_install(
        [
            "gnome-tweaks",
            "arc-theme",
            "zsh",
            "guake",
            "adobe-source-code-pro-fonts",
            "powerline-fonts",
        ]
    )
    # Frequently used programs
    dnf_install(
        [
            "virt-manager",
            "clementine",
            "filelight",
            "radare2",
            "dnf-utils",
            "nano",
            "google-chrome-stable",
        ]
    )
    # Dev stuff
    dnf_install(
        [
            "boost-devel",
            "clang",
            "llvm",
            "lldb",
            "libcxx-devel",
            "gcc",
            "code",
            "valgrind",
            "dotnet",
        ]
    )
    # Remove firefox
    dnf_remove("firefox")

    flathub_install("com.discordapp.Discord")
    flathub_install("com.spotify.Client")
    flathub_install("io.github.Hexchat")

def config():
    pass
