FROM vaultwarden/server@sha256:9a905c5cf5df61bb827da3805e160170741c0b53b0c63bb07e1afd3d2e21b1c8

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
