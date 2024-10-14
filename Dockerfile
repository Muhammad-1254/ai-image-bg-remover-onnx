FROM python:3.10-slim

# Create a new user
RUN useradd -m -u 1000 app

# Set the working directory inside the container
WORKDIR /code

# Copy the requirements.txt file and install dependencies
COPY requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the entire project to the working directory
COPY . .

# Expose the port (make sure Flask app runs on this port)
EXPOSE 7860

# Switch to non-root user
USER app

# Run the Flask application
CMD ["python", "app.py"]
