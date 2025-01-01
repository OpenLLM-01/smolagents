# Base Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    libjpeg-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY . /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install the package
RUN pip install -e .

COPY server.py /app/server.py

# Expose the port your server will run on
EXPOSE 65432

CMD ["python", "/app/server.py"]
