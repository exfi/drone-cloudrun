# drone-cloudrun (drone - cloud run - gcp)
# in a container
#
# docker run --rm -it \
# 	exfi/drone-cloudrun:1
FROM google/cloud-sdk:alpine
LABEL maintainer "Mario Pardo <marioapardo@gmail.com>"

RUN gcloud components install beta --quiet

COPY run.sh /

ENTRYPOINT ["/bin/bash"]

CMD ["/run.sh"]