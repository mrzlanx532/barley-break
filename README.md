# Deployment
1. follow to root project folder
2. `cd docker && docker-compose up -d`
3. `docker exec -ti php /bin/bash`
4. `sh init.sh`
5. `exit`
6. `docker-compose run npm install && docker-compose run npm run dev`
7. Add to /etc/hosts `127.0.0.1     game-at-15`
