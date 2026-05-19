SERVER_KEY ?= server.key
SERVER_CERT ?= server.crt

# Example and default to generate tentative cert and key.
# 1. Modify this according to your needs.
# 2. touch server.key to force re-generating the key and cert.
# 3. Run make, e.g. make -C config/cert/
SERVER_NAME ?= registry.lab-10.local

all: $(SERVER_CERT)

$(SERVER_CERT): $(SERVER_KEY)
	openssl req -x509 -newkey rsa:4096 \
		-keyout $(SERVER_KEY) \
		-out $@ \
		-days 3650 -nodes \
		-subj "/CN=$(SERVER_NAME)" \
		-addext "subjectAltName = DNS:$(SERVER_NAME)"
