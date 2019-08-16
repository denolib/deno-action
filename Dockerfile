FROM ubuntu:19.10

WORKDIR /root

LABEL version="0.15.0"
LABEL repository="https://github.com/axetroy/actions-deno"
LABEL homepage="https://github.com/axetroy/actions-deno"
LABEL maintainer="Axetroy <axetroy.dev@gmail.com>"

LABEL com.github.actions.name="GitHub Action for Deno"
LABEL com.github.actions.description="Wraps the Deno CLI."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"

ENV DENO_VERSION v0.15.0

RUN apt-get update \
  && apt-get install -y curl \
  && curl --version

RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s $DENO_VERSION \
  && ln -s $HOME/.deno/bin/deno /usr/local/bin/deno

ENV DENO_DIR /root/.deno

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "deno" ]