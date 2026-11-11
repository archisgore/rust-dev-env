FROM clux/muslrust:stable

# Rust components
RUN rustup component add clippy && \
    rustup component add rustfmt && \
    rustup install nightly-x86_64-unknown-linux-gnu && \
    apt-get update -y && \
    apt-get install -y vim pkg-config libssl-dev protobuf-compiler libprotobuf-dev

# Developer tools are host binaries: build them for the gnu host against the
# system OpenSSL, not the image's default musl target / static /musl OpenSSL.
# (cargo-udeps dropped: its openssl-sys build fails in this image and no CI uses it.)
RUN env -u OPENSSL_DIR -u OPENSSL_STATIC -u PKG_CONFIG_PATH -u PKG_CONFIG_ALL_STATIC \
        -u PKG_CONFIG_ALLOW_CROSS CARGO_BUILD_TARGET=x86_64-unknown-linux-gnu sh -c '\
    cargo install --locked cargo-bloat && \
    cargo install --locked twiggy && \
    cargo install --locked cargo-all-features && \
    cargo install --locked sccache && \
    cargo install --locked cargo-edit'
