# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory to /app
WORKDIR /app

#create DB mount point
RUN mkdir /app/db

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip3 install -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5001

# Run app when the container launches
CMD ["gunicorn", "-b", "0.0.0.0:5001", "--worker-class", "eventlet", "-w" , "1", "dash:app"]