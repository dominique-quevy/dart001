#!/bin/bash
rm -vf apt_installed.txt
apt list | grep 'installed' > apt_installed.txt