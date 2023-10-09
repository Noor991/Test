# Use an official Python 3.11 image.
FROM python:3.11-slim

# Set the working directory in Docker to /app
WORKDIR /Test

# Copy the current directory contents into the container at /app
COPY . /Test

# Install FastAPI and Uvicorn
RUN pip install --no-cache-dir fastapi uvicorn

# Specify the command to run on container start
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
