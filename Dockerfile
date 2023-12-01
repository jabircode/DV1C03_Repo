# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Update package lists and install apache2
RUN apt-get update && apt-get install -y apache2

# Expose port 80
EXPOSE 80

# Start apache2 in the foreground on container startup
CMD ["apache2ctl", "-D", "FOREGROUND"]

#
