# Use official Nginx image
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy custom HTML content (ensure the path on host is correct)
COPY ./html/ /usr/share/nginx/html/

# Set permissions (optional but good for debugging)
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start NGINX (optional override, default CMD is fine)
CMD ["nginx", "-g", "daemon off;"]
