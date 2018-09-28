# dockermotion

```
docker build -t=motion:1 ./Dockerfile
docker run --name mymotion -d -p 10000:8080 motion:1 motion -c /etc/motion/motion.conf
```


## Things to do

- mount motion configuration files
- sort out persistent storage for the images
- clean up nginx
- create a front end
- enable https via letencrypt
- configure database backend
- create docker-compose
- create S3 and glacier backup mechanism
- create backup interface
