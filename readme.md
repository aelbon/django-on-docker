Artikel:
Dockerizing Django with Postgres, Gunicorn, and Nginx

Link:
https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/

Dev
===
Build the image:
docker-compose build

Run the container:
docker-compose up -d

Build and run:
docker-compose up --build -d

Logs:
docker-compose logs -f

Remove containers and volumes:
docker-compose down -v

Navigate to http://localhost:8010

Poduction
=========
Docker commands:
docker-compose -f docker-compose.prod.yml down -v
docker-compose -f docker-compose.prod.yml up -d --build
docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput

The app is up and running at http://localhost:1337
