FROM tensorflow/tensorflow:latest

#RUN apt-get update && apt-get install -y curl
#RUN apt-get install wget
RUN apt-get update
RUN apt-get install -y wget ca-certificates curl gnupg lsb-release
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get --yes install docker-ce docker-ce-cli containerd.io docker-compose-plugin
#docker build -t adsoft/ai-ops:latest .
