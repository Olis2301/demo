# Gunakan image Python
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy file
COPY app.py .

# Install Flask
RUN pip install Flask

# Jalankan aplikasi
CMD ["python", "app.py"]
