FROM clux/muslrust:stable

# Rust components
RUN rustup component add clippy && \
    rustup component add rustfmt && \
    rustup install nightly-x86_64-unknown-linux-gnu && \
    cargo install --locked cargo-bloat && \
    cargo install --locked cargo-udeps && \
    cargo install --locked twiggy && \
    cargo install --locked cargo-all-features && \
    cargo install --locked sccache && \
    cargo install --locked cargo-edit && \
    apt-get update -y && \
    apt-get install -y vim
