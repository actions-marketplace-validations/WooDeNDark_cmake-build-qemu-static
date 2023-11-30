ARG PLATFORM=${platform}
ARG IMAGE=${image}

FROM ${PLATFORM}/${IMAGE}:latest
LABEL authors="WooDeNDark"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
