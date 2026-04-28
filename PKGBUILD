# Maintainer: Till Ehrengruber <till.ehrengruber@cscs.ch>
pkgname=cscs-key
pkgver=1.1.0
pkgrel=1
pkgdesc="Command-line tool to manage SSH keys for the Swiss National Supercomputing Centre (CSCS)"
arch=('x86_64' 'aarch64')
_gh_repo=eth-cscs/cscs-key
url="https://github.com/$_gh_repo"
license=('custom')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f604d03a49e122712727864ff9fd903c18a9868bf7e280d71fd9d6b7c7728c16')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Generate and install shell completions
  "$pkgdir/usr/bin/$pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "$pkgdir/usr/bin/$pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "$pkgdir/usr/bin/$pkgname" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}