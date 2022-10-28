# See here for image contents: https://hub.docker.com/r/jupyter/datascience-notebook/

FROM jupyter/datascience-notebook

# common-debian.sh is run here:
# https://github.com/microsoft/vscode-dev-containers/tree/main/script-library#development-container-scripts
# Note: user and group must have the same non-root name

COPY builderfiles/common-debian.sh /tmp/library-scripts/
USER root
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && groupadd jovyan \
  && usermod -g jovyan -a -G users jovyan \
  && bash /tmp/library-scripts/common-debian.sh \
  && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
COPY builderfiles/requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install --upgrade -r /tmp/pip-tmp/requirements.txt \
  && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

USER jovyan