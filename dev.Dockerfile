FROM mcr.microsoft.com/dotnet/sdk:9.0

RUN dotnet tool install -g pbm
ENV PATH="${PATH}:/root/.dotnet/tools"

WORKDIR /app
COPY . /app

RUN dotnet build

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
RUN apt-get update && apt-get install -y netcat-openbsd
