FROM webhippie/python:2
MAINTAINER Thomas Boerger <thomas@webhippie.de>

WORKDIR /srv/app
ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["bash"]

RUN apk update && \
  apk add \
    texlive-luatex@testing \
    zlib-dev \
    jpeg-dev && \
  pip install \
    reportlab \
    rst2pdf \
    sphinxcontrib-phpdomain \
    sphinxcontrib-golangdomain \
    sphinxcontrib-disqus \
    sphinxcontrib-email \
    sphinxcontrib-fancybox \
    sphinxcontrib-gravatar \
    sphinxcontrib-httpdomain \
    sphinxcontrib-imagehelper \
    sphinxcontrib-images && \
  rm -rf /var/cache/apk/*

ADD rootfs /

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/dockhippie/sphinx.git"
LABEL org.label-schema.name="Sphinx"
LABEL org.label-schema.vendor="Thomas Boerger"
LABEL org.label-schema.schema-version="1.0"
