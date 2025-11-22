FROM python:3.13-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg gcc g++ make && \
    curl -O https://packages.microsoft.com/debian/12/prod/pool/main/m/msodbcsql18/msodbcsql18_18.5.1.1-1_amd64.deb && \
    ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive dpkg -i msodbcsql18_18.5.1.1-1_amd64.deb  || apt-get install -f -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN rm .env

EXPOSE 8000

CMD ["uvicorn","main:app", "--host", "0.0.0.0", "--port", "8000"] 

