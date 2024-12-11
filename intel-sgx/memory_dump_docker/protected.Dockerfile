# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

FROM gramineproject/gramine:1.8-noble@sha256:5aa905d0cd17c6cc925bf79f38c79c0ed176af6fd273839381029f9a8c1f93d6

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN gramine-sgx-gen-private-key

COPY app /app
WORKDIR /app

RUN make

ENTRYPOINT []
CMD ["gramine-sgx","./python"]
