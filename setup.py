#!/usr/bin/env python3

import os
import distro

import systems

current_distro = distro.id

if current_distro == "fedora":
    this_system = systems.fedora

elif current_distro == "arch":
    this_system = systems.arch

else:
    print("Distro not supported yet.")
    exit()


this_system.init()
this_system.install()
this_system.config()