```
docker build -t astro-nginx .
```

```
docker run -d -p 8080:80 astro-nginx
```

OR

```
docker run -it -p 8080:80 --name my-app --rm astro-nginx
```