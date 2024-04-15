FROM ubuntu:22.04 as base

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install \
    -y build-essential cmake git libgmp3-dev libprocps-dev libboost-all-dev libssl-dev libsodium-dev nano curl

RUN git clone https://github.com/0xPolygonMiden/miden-vm.git
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR miden-vm

RUN cd miden && cargo build --profile optimized --features concurrent,executable

COPY matmul/ matmul/
COPY sha256/ sha256/
COPY fib/ fib/

RUN bash -c "time ./target/optimized/miden prove -a sha256/sha256.masm -n 8"
RUN bash -c "time ./target/optimized/miden verify -p sha256/sha256.proof -h 24ccbc2da4349dd09049c4c25c9a71b1436c04139ad366eef9abed723e8705d8"

# RUN time ./target/optimized/miden prove -a matmul/matmul.masm -n <outputs>
# RUN time ./target/optimized/miden verify -p matmul/matmul.proof -h <program hash>
