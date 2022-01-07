FROM elixir:1.13

ENV PHOENIX_VERSION 1.6.6
ENV NODE_VERSION 16.x
ENV NPM_VERSION 8.1.2

# NODE/NPM
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
  && apt-get install -y nodejs
RUN npm install npm@${NPM_VERSION} -g

# Phoenix
RUN mix local.hex --force && \
  mix archive.install --force hex phx_new ${PHOENIX_VERSION} && \
  mix local.rebar --force

# Utils
RUN apt install -y inotify-tools vim lv

WORKDIR /srv
