# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

FROM ubuntu:24.04@sha256:80dd3c3b9c6cecb9f1667e9290b3bc61b78c2678c02cbdae5f0fea92cc6734ab

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3 \
    && rm -rf /var/lib/apt/lists/*

COPY app/secret.py /app/secret.py
WORKDIR /app

ENTRYPOINT []
CMD ["python3","./secret.py"]
