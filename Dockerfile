# Use Python 3.10 slim image for minimal footprint
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY main.py .
COPY api/ ./api/

# Set environment variables (can be overridden by docker-compose or .env)
ENV PYTHONUNBUFFERED=1

# Run the MCP server
CMD ["python", "main.py"]
