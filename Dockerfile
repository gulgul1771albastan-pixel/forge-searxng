FROM searxng/searxng:latest

USER root

COPY settings.yml /etc/searxng/settings.yml
COPY crabx/ /usr/local/searxng/searx/templates/simple/
COPY crabx-static/ /usr/local/searxng/searx/static/themes/simple/

# Drop old compressed theme files, rebuild from Simply Nord assets
RUN find /usr/local/searxng/searx/static/themes/simple -type f \( -name '*.gz' -o -name '*.br' \) -delete \
 && find /usr/local/searxng/searx/static/themes/simple -type f \( -name '*.css' -o -name '*.js' -o -name '*.html' -o -name '*.svg' \) \
      -exec gzip -9 -k {} + \
      -exec brotli -9 -k {} + || true \
 && chown -R 977:977 /usr/local/searxng/searx/templates/simple \
                      /usr/local/searxng/searx/static/themes/simple

USER 977
EXPOSE 8080
