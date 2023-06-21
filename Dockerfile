# Base image
FROM python:3.8-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN apk add --no-cache gcc musl-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del gcc musl-dev

# Copy the Flask application code and templates
COPY . .

# Expose the port your Flask app is listening on
EXPOSE 5000

# Set the entrypoint command
ENTRYPOINT ["python"]

# Set the default command to run the Flask application
CMD ["app.py"]

