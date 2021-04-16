# A short recipe challenge for Marley Spoon
It fetches a list of recipes from Contentful space and presents it as a simple grid. Details on each recipe are available by clicking on its title.

# How to run

Copy `.env.example` and put your super secret Contentful credentials in.
```
$ cp .env.example .env
$ vim .env
```

Start up.
```
$ docker-compose build
$ docker-compose up -d
```

Check your localhost:8080
