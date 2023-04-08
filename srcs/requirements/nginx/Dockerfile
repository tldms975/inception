FROM debian:buster-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    nginx

# Copy nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port
EXPOSE 80
EXPOSE 443

# Start services
CMD ["nginx", "-g", "daemon off;"]
