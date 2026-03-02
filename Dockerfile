# Use a small, secure base image
FROM nginx:1.25-alpine

# Remove default index and copy our custom one
RUN rm -f /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html

# (Optional) set a simple healthcheck
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- http://localhost/ || exit 1

# Expose port (informational)
EXPOSE 80

# NGINX provided default command
``
