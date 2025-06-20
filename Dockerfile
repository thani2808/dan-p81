# Base image
FROM nginx:alpine

# Remove default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom HTML
COPY usr/share/nginx/html/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
