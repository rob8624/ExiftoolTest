# Use the official Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements.txt first to leverage Docker caching
COPY requirements.txt /app/

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the application code
COPY . /app/

# Command to start the Django app with Gunicorn
CMD ["gunicorn", "exiftest.wsgi:application", "--bind", "0.0.0.0:8000"]
