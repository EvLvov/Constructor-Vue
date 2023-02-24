# Stage Build #
FROM node:14-alpine AS builder

RUN apk --update add git

WORKDIR /app

COPY . .

RUN npm install
RUN npm ci

ENV NODE_ENV=production

RUN npm run build

# Stage Serve production #
FROM andreilhicas/nginx-letsencrypt AS production

COPY --from=builder --chown=nginx:nginx /app/dist /usr/share/nginx/html
COPY --from=builder --chown=nginx:nginx /app/nginx.conf /

RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

EXPOSE 8080

STOPSIGNAL SIGTERM
