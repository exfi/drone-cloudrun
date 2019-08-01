FROM google/cloud-sdk:alpine

RUN gcloud components install beta --quiet

COPY run.sh /

ENTRYPOINT ["/bin/bash"]

CMD ["/run.sh"]