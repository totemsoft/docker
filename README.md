# Docker projects :: Totem Software Pty Ltd
Docker projects

## Docker Compose
Set default values for environment variables using a `.env` file, which Compose automatically looks for. Values set in the shell environment override those set in the `.env` file.

    docker-compose -f docker-compose.yml up
    docker-compose -f docker-compose.yml up --remove-orphans
    docker ps -a
    docker images
    docker image prune
    docker image rm <image_id>
    