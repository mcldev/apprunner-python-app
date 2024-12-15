# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0
FROM python:3.10-alpine

# Install system dependencies
RUN apk add --no-cache geos gdal proj py3-gdal
#    binutils \
#    gdal-bin \
#    libproj-dev \
#    libgdal-dev

# Set environment variables
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# Install Python dependencies
COPY . /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip3 install  --no-cache-dir -r requirements.txt

# Run the application
ENV FLASK_APP=app
ENV test_var=some_other_value

EXPOSE 8000
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]