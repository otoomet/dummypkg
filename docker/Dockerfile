# -*- dockerfile-mode -*-
FROM rocker/r-devel
ENV INSIDE_DOCKER=true
# RUN rm /usr/bin/R
# RUN rm /usr/bin/Rscript
# RUN rm -rf /usr/lib/R
COPY packages.R .
RUN RDscript packages.R
COPY ../pkg ./dummypkg
COPY build-check .
CMD ["bash"]
