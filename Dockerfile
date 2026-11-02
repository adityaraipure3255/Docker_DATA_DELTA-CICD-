# Use Python 3.10 base image
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY app ./app

COPY ml ./ml /app/

RUN python ml/train.python

EXPOSE 8000

CMD [ "sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${port:-8000}" ]

