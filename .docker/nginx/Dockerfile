FROM nginx:1.15.10

LABEL maintainer="tiennguyenhoang339@gmail.com"

RUN apt-get update -y && apt-get install -y \
	vim \
	openssl

CMD ["nginx"]

EXPOSE 80 443
