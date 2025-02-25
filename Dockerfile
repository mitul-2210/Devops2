FROM ubuntu

# Install dependencies
RUN apt update -y && apt install python3 python3-pip python3-venv -y

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . /app/

# Create and activate a virtual environment
RUN python3 -m venv venv
RUN . venv/bin/activate

# Install dependencies inside the virtual environment
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt

# Expose the port
EXPOSE 80

# Run the FastAPI application
CMD venv/bin/python main.py
