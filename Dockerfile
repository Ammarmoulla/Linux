# FROM node:18-alpine as builder

# WORKDIR /info-formio

# RUN apk add --no-cache git make gettext


# # ENV NODE_ENV=production


# COPY info-formio .
# RUN npm cache clean --force && npm install --legacy-peer-deps


# ARG DEVELOPMENT_URL_API
# ARG DEVELOPMENT_URL
# ARG UAE_PASS_URL

# ENV DEVELOPMENT_URL_API=${DEVELOPMENT_URL_API}
# ENV DEVELOPMENT_URL=${DEVELOPMENT_URL}
# ENV UAE_PASS_URL=${UAE_PASS_URL}

# RUN npm install @superset-ui/switchboard@0.18.26-2 && \
#    rm -rf .next && \
#    npm run build

# EXPOSE 3000

# CMD ["npm","start"]

FROM node:18-alpine AS builder

WORKDIR /info-formio

RUN apk add --no-cache git make gettext

COPY info-formio .

RUN npm cache clean --force && npm install --legacy-peer-deps && npm install @superset-ui/switchboard@0.18.26-2

ARG DEVELOPMENT_URL_API
ARG DEVELOPMENT_URL
ARG UAE_PASS_URL

ENV DEVELOPMENT_URL_API=${DEVELOPMENT_URL_API}
ENV DEVELOPMENT_URL=${DEVELOPMENT_URL}
ENV UAE_PASS_URL=${UAE_PASS_URL}

RUN npm run build

FROM node:18-alpine AS runner

WORKDIR /info-formio

ENV NODE_ENV production

RUN adduser -D -s /bin/sh nextjs

COPY --from=builder /info-formio/public ./public

RUN mkdir .next
RUN chown nextjs:nextjs .next

COPY --from=builder --chown=nextjs:nextjs /info-formio/.next/standalone ./
COPY --from=builder --chown=nextjs:nextjs /info-formio/.next/static ./.next/static

#USER nextjs

ENV HOSTNAME "0.0.0.0"

CMD ["node", "server.js"]



FROM oven/bun:alpine AS deps

WORKDIR /info-formio

RUN apk add --no-cache git make gettext

COPY info-formio .

RUN npm cache clean --force && npm install --legacy-peer-deps && npm install @superset-ui/switchboard@0.18.26-2


FROM oven/bun:alpine AS builder
WORKDIR /info-formio

COPY --from=deps /info-formio/node_modules ./node_modules
COPY info-formio .
ARG DEVELOPMENT_URL_API
ARG DEVELOPMENT_URL
ARG UAE_PASS_URL

ENV DEVELOPMENT_URL_API=${DEVELOPMENT_URL_API}
ENV DEVELOPMENT_URL=${DEVELOPMENT_URL}
ENV UAE_PASS_URL=${UAE_PASS_URL}

RUN bun run build