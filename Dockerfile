# Use a small, secure base image
FROM nginx:1.25-alpine

# Remove default index and copy our custom one
RUN rm -f /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html

# Expose port (informational)
EXPOSE 80
