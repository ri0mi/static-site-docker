FROM nginx:alpine
COPY sitio/ /usr/share/nginx/html/ 
EXPOSE 80

