FROM python:3.10-slim

# Install FFmpeg and system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libffi-dev \
    libnacl-dev \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy everything else
COPY . .

# Run the bot
CMD ["python", "denli.py"]
