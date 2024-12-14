# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0
FROM public.ecr.aws/amazonlinux/amazonlinux:latest
RUN dnf update -y
RUN dnf install python3.10 -y && curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
CMD python3 app.py
EXPOSE 8080
