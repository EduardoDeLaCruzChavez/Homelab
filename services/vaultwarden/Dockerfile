FROM vaultwarden/server@sha256:d16a304c2476fd787634ddde2c00be8fdfa1a72539438c626ece3686b5b88ab4

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
