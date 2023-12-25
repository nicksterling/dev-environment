# if ${args[--os]} is darwin
if [[ "${args[--os]}" == darwin ]]; then
    # Check to see if the executable exists
    if [[ ! -f ./.gui/bin/webtop-gui-darwin-${args[--arch]}/webtop-gui.app/Contents/MacOS/webtop-gui ]]; then
        echo "Error: ./.gui/bin/webtop-gui-darwin-${args[--arch]}/webtop-gui.app/Contents/MacOS/webtop-gui does not exist"
        exit 1
    fi
        # Run the command in ./.gui/bin/webtop-gui-darwin-${args[--arch]}/webtop-gui.app/Contents/MacOS/webtop-gui
    ./.gui/bin/webtop-gui-darwin-${args[--arch]}/webtop-gui.app/Contents/MacOS/webtop-gui
fi

# if ${args[--os]} is linux
if [[ "${args[--os]}" == linux ]]; then
    # Check to see if the executable exists
    if [[ ! -f ./.gui/bin/webtop-gui-linux-${args[--arch]}/webtop-gui ]]; then
        echo "Error: ./.gui/bin/webtop-gui-linux-${args[--arch]}/webtop-gui does not exist"
        exit 1
    fi

    # Run the command in ./.gui/bin/webtop-gui-linux-${args[--arch]}/webtop-gui
    ./.gui/bin/webtop-gui-linux-${args[--arch]}/webtop-gui
fi

## if ${args[--os]} is win32
if [[ "${args[--os]}" == win32 ]]; then
    # Check to see if the executable exists
    if [[ ! -f ./.gui/bin/webtop-gui-win32-${args[--arch]}/webtop-gui.exe ]]; then
        echo "Error: ./.gui/bin/webtop-gui-win32-${args[--arch]}/webtop-gui.exe does not exist"
        exit 1
    fi

    # Run the command in ./.gui/bin/webtop-gui-win32-${args[--arch]}/webtop-gui.exe
    ./.gui/bin/webtop-gui-win32-${args[--arch]}/webtop-gui.exe
fi
