#Apache Nutch + MongoDB Docker

Build using below command :
docker-compose up --build

Run as daemon using below command :
docker-compose up -d

Stop :
docker-compose stop

Change the http.agent.name inside nutch-site.template

## Create MongoDB User
Run below command :
docker exec -it <docker_container_id> mongo admin

Run below command after connected to the MongoDB :
db.createUser({user:"system",pwd:"secret", roles:[{role:"root",db:"admin"}]});
exit;

Run below command :
docker exec -it <docker_container_id> mongo admin -u system -p

Run below command after connected to the MongoDB :
use crawler;
db.createUser({user:"crawler",pwd:"secret", roles:[{role:"readWrite",db:"crawler"}]});

## Apache Nutch GUI
You can access the Apache Nutch GUI at http://localhost:8080

### Add instance in Apache Nutch GUI :
Host: localhost
Port: 8081

If you add another Apache Nutch docker container, just register the instance in the first container :
Host: <the_linked_container_name>
Port: 8081

### Create a Seed List steps
1) Put the seed list name first, then do save.
2) Edit the seed list saved.
3) Put URLs one per line.
4) Do save.

### Create Crawls steps
1) Put the crawl name.
2) Select the Seed list previously created.
3) Do save.

After created, click the play button.

Note: Apache Nutch GUI still buggy, so be prepare to get error.

### Check crawled pages inside MongoDB
Download any MongoDB GUI Client. Connect the client into MongoDB container on 27017 port and at "crawler" database. You will have "webpage" collection after connected.

You can do whatever needed to with crawled pages stored in MongoDB, in example parse the pages data inside "content" field using PHP and HTML5 library parser. The "content" data will be in binary format. In PHP you can get the raw HTML using following code :

$content = sprintf('%s', $content->bin);
