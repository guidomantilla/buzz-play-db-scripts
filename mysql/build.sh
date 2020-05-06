PARENT_NAME=$1
if [ -z "$PARENT_NAME" ]; then
    APP_NAME=buzz-play-mysql
else
    APP_NAME="$PARENT_NAME"
fi

PARENT_PORT=$2
if [ -z "$PARENT_PORT" ]; then
    PORT=3309
else
    PORT="$PARENT_PORT"
fi

PARENT_PASSWORD=$3
if [ -z "$PARENT_PASSWORD" ]; then
    PASSWORD="raven123"
else
    PASSWORD="$PARENT_PASSWORD"
fi


docker build . -t "$APP_NAME" \
&& docker container rm --force "$APP_NAME" 
   docker container run --detach --restart always \
                        --network buzz-play-network \
                        --env MYSQL_ROOT_PASSWORD="$PASSWORD" \
                        --publish "$PORT":3306 \
                        --name "$APP_NAME" "$APP_NAME"
