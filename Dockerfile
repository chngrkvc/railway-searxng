FROM searxng/searxng:latest

COPY settings.yml /etc/searxng/settings.yml

ENV SEARXNG_SECRET_KEY=changeme

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:8080/healthz || exit 1
