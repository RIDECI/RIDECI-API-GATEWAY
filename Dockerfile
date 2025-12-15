FROM kong:3.4
USER root
RUN mkdir -p /usr/local/kong/declarative
COPY kong.yml /usr/local/kong/declarative/kong.yml
RUN chown -R kong:kong /usr/local/kong/declarative
USER kong
ENTRYPOINT ["/entrypoint.sh"]