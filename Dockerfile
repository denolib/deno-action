FROM ubuntu:19.10

WORKDIR /root

LABEL version="0.18.0"
LABEL repository="https://github.com/denolib/deno-action"
LABEL homepage="https://github.com/denolib/deno-action"
LABEL maintainer="Axetroy <axetroy.dev@gmail.com>"

LABEL com.github.actions.name="GitHub Action for Deno"
LABEL com.github.actions.description="Wraps the Deno CLI."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"

ENV DENO_VERSION v0.18.0

RUN apt-get update \
  && apt-get install -y curl \
  && curl --version

RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s $DENO_VERSION \
  && ln -s $HOME/.deno/bin/deno /usr/local/bin/deno

ENV DENO_DIR /root/.deno

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "deno" ]