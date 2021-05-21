# Headless Wordpress with NextJS

This repository explains how to deploy a headless wordpress backend with a nextjs frontend on your development environment.

## Getting Started

### Application Settings

Create an .env file on the project root folder and set the following environment variables:

```env
DB_NAME=dbname
DB_USER=dbuser
DB_PASSWORD=dbpass
WP_USER=admin
WP_PASS=adminPWD
WP_TITLE=Headless Wordpress
WP_EMAIL=admin@example.com
```

Change accordingly to your needs.

### Docker

You can use the docker-compose file directly if you want, just install all needed tools and run the compose executable to start the containers.

```bash
# Starts all services defined on docker-compose.yml as background services
docker-compose up -d
```

You can stop the containers using the stop command and check the console output with the logs utility.

```bash
# Stop and remove all containers
docker-compose down

# Check logs of all containers, use the -f flag to check live output
docker-compose logs
``` 

### Vagrant

If you don’t want to mess with docker on your host system, vagrant is always a great option and very easy to use, just run the up command on the project root folder to start.

```bash
# Starts a new virtual machine on the specified provider with the settings defined on your Vagrantfile
vagrant up
```

Before starting, run the following instruction on your host system to configure the docker-compose plugin on your vagrant installation:

```bash
vagrant plugin install vagrant-docker-compose
```

Using the ssh command will connect you to the running instance of your vagrant virtual machine and there you are free to run any docker commands needed.

```bash
vagrant ssh
```

The halt command equals to a shutdown to the virtual machine and the destroy utility do as the name says and remove all traces of the VM from your system. 

```bash
# Stops virtual machine execution
vagrant halt

# Destroys virtual machine and remove all files associated
vagrant destroy
```

## Customizations

You can customize the wordpress installation, by installing php modules or changing the ini files by building an image based on the `wordpress.dockerfile` file, present on the project root folder, just uncomment the following lines on `docker-compose.yml` to build an image instead of pulling the existing one:

```dockerfile
wordpress:
    # Uncomment the build lines
    build:
      dockerfile: wordpress.dockerfile
      context: .
    # Comment the image line
    # image: wordpress
```

## Testing

In both cases, the ports `80` and `3000` are mapped to the docker services and will be available to your host system.

So, just open <http://localhost:3000> to access the Next JS application or <http://localhost> to check Wordpress frontend.

The data from wordpress is fetched by a GraphQL API available at:

- <http://localhost/graphql> or <http://localhost/index.php?graphql>

You can test your installation and query some data yourself using the this tool:

- <https://altair.sirmuel.design/>

## References

- Vagrant - <https://www.vagrantup.com/>
- Docker - <https://www.docker.com/>
- Vagrant Docker Compose - <https://github.com/leighmcculloch/vagrant-docker-compose>
- NextJS - <https://nextjs.org/>
- NextJS with Wordpress - <https://github.com/vercel/next.js/tree/canary/examples/cms-wordpress>
- Wordpress GraphQL - <https://www.wpgraphql.com/>

https://stackoverflow.com/questions/50999848/how-to-run-wp-cli-in-docker-compose-yml