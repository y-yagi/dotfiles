#!/bin/bash

set -e

# tools
obt mattn/memo

obt y-yagi/jpcal
# obt y-yagi/blogrep
# obt y-yagi/multi-ag
go install github.com/y-yagi/goto@latest
go install github.com/y-yagi/tomato/cmd/tomato@latest
go install github.com/y-yagi/open-hub@latest
go install github.com/y-yagi/measure@latest
go install github.com/y-yagi/ags@latest
go install github.com/y-yagi/gtodo/cmd/gtodo@latest
go install github.com/y-yagi/once@latest
go install github.com/y-yagi/eijiro/cmd/eijiro@latest
go install github.com/y-yagi/gtodo/cmd/gtodo@latest
go install github.com/y-yagi/fork@latest

# obt davecheney/httpstat
obt ajeetdsouza/zoxide
obt sharkdp/fd

sudo apt install snapd
sudo snap install btop

obt suzuki-shunsuke/pinact
