_: {
  # idempotently install Xcode's Command Line Tools if `xcode-select -p` reports
  # no Xcode-related things installed. This is impure but there's no really good
  # way to do this with Nix only.
  system.activationScripts.postActivation.text = ''
    DEV_DIR="$(/usr/bin/xcode-select -p 2>/dev/null)" || true
    if [ -z "$DEV_DIR" ] || [ ! -d "$DEV_DIR" ]; then
      echo "Command Line Tools not found — requesting install..."
      /usr/bin/xcode-select --install
    fi

    # Authorize debugging (attaching lldb/gdb to other processes) without
    # a per-launch GUI prompt. Persistent, system-wide setting — see:
    # `man DevToolsSecurity`.
    if ! /usr/sbin/DevToolsSecurity -status 2>/dev/null | grep -q 'enabled'; then
      echo "Enabling Developer Tools security (debugger authorization)..."
      /usr/sbin/DevToolsSecurity -enable
    fi
  '';
}
