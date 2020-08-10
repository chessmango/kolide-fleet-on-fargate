FROM kolide/fleet

RUN apk --no-cache update && apk --no-cache add python3 py3-pip py3-setuptools ca-certificates curl groff less jq && pip3 --no-cache-dir install awscli && rm -rf /var/cache/apk/* && mkdir /certs && mkdir /kolide

COPY run.sh /kolide/run.sh
RUN chmod +x /kolide/run.sh && ln -sf /dev/stdout /tmp/osquery_result && ln -sf /dev/stderr /tmp/osquery_status

ENV KOLIDE_SERVER_CERT=/certs/kolide.crt
ENV KOLIDE_SERVER_KEY=/certs/kolide.key
CMD ["/kolide/run.sh"]
