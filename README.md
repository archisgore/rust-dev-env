# rust-dev-env
Rust Development Environment docker container (based on clux/muslrust for static builds)

Based on this: https://github.com/clux/muslrust and eternally grateful and thankful for the
muslrust project which helped [ZeroTect](https://github.com/polyverse/zerotect) happen.

This docker adds a few more components I like to have at development time (I build in Docker on my mac
for cheap repeatable environments.)

Notably: cargo-bloat, flamegraph and clippy (for linting).
