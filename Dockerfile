FROM searxng/searxng:latest

COPY settings.yml /etc/searxng/settings.yml
COPY crabx /usr/local/searxng/searx/templates/simple
COPY crabx-static /usr/local/searxng/searx/static/themes/simple

EXPOSE 8080
