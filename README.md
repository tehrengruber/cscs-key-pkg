# cscs-key-pkg

Arch Linux package for [cscs-key](https://github.com/eth-cscs/cscs-key), the command-line tool to manage SSH keys for the Swiss National Supercomputing Centre (CSCS).

## Installation

Import the signing key:

```sh
curl -s https://raw.githubusercontent.com/tehrengruber/cscs-key-pkg/refs/heads/main/sign_key.gpg | sudo pacman-key --add -
sudo pacman-key --lsign-key B49B4D3FDBBB7AEE
```

Install the package (replace the version with the [latest release](https://github.com/tehrengruber/cscs-key-pkg/releases)):

```sh
sudo pacman -U https://github.com/tehrengruber/cscs-key-pkg/releases/download/v1.1.0-1/cscs-key-1.1.0-1-x86_64.pkg.tar.zst
```