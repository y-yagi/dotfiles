#!/bin/bash

set -e

# tools
go get -f -u golang.org/x/tools/cmd/goimports

go get -f -u github.com/mattn/memo
go get -f -u github.com/mattn/mkup

go get -f -u github.com/y-yagi/jpcal
go get -f -u github.com/y-yagi/jptenki
go get -f -u github.com/y-yagi/myrepo
go get -f -u github.com/y-yagi/blogrep
go get -f -u github.com/y-yagi/multi-ag
go get -f -u github.com/y-yagi/egose
go get -f -u github.com/y-yagi/goto
go get -f -u github.com/y-yagi/tomato/cmd/tomato
go get -f -u github.com/y-yagi/open-hub
go get -f -u github.com/y-yagi/github-trending
go get -f -u github.com/y-yagi/weatherer/cmd/weatherer
go get -f -u github.com/y-yagi/measure
go get -f -u github.com/y-yagi/ags
go get -f -u github.com/y-yagi/bookmarker-go

go get -f -u github.com/davecheney/httpstat
