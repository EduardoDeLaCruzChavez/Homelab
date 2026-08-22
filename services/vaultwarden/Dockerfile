FROM vaultwarden/server@sha256:b094afed4ed5ea353821c6efcedca446f30c6654ba2bc441db6089b0c2b94ac8

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
