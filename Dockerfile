# Use the official Debian slim image as the base image
FROM debian:bullseye-slim

# Install necessary dependencies for building Rust applications
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    wget \
    curl \
    ca-certificates \
    libssl-dev

# Install Rust using rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Create a directory for your Rust project
WORKDIR /usr/src/educative_io-learn-rust

# Copy the Cargo.toml and Cargo.lock files
COPY Cargo.toml Cargo.lock ./

# Copy the source code
COPY src ./src

# Compile the Rust code
RUN cargo build --release

# Specify the entry point for the application
CMD ["./target/release/educative_io-learn-rust"]
