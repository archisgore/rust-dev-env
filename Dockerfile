FROM clux/muslrust:stable

# Rust components
RUN rustup component add clippy && \
    rustup component add rustfmt && \
    rustup install nightly-x86_64-unknown-linux-gnu && \
    cargo install cargo-bloat && \
    cargo install cargo-udeps --locked && \
    cargo install twiggy && \
    cargo install cargo-all-features && \
    cargo install sccache && \
    cargo install cargo-edit && \
    apt-get update -y && \
    apt-get install -y vim
