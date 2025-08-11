# -*- dockerfile-mode -*-
FROM rocker/r-devel
RUN apt-get -y install tidy ghostscript qpdf
ENV INSIDE_DOCKER=true
# RUN rm /usr/bin/R
# RUN rm /usr/bin/Rscript
# RUN rm -rf /usr/lib/R
COPY docker/packages.R .
RUN RDscript packages.R
COPY pkg ./dummypkg
COPY docker/build-check .
CMD ["bash"]
