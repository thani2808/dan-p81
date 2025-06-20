# Use official Nginx image
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy only your HTML content
COPY usr/share/nginx/html/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
