# utility script to build docker image
echo "Build and deploy ddb-dash docker image..."

# clear out any previous versions
docker stop ddb-dash
docker rm ddb-dash

#set $1 to default port if not passed in
if [ -z "$1" ]
  then
    echo "No port argument supplied, using default port 5001"
    set -- "5001"
fi

# move dockerfile into place
cp Dockerfile ../src/
cd ../src

# build and run docker image on port passed into script
docker image build -t ddb-dash .
docker run -d --name ddb-dash -v ddb-dash:/app/db -p $1:5001 ddb-dash

#cleanup
rm Dockerfile

# dump out running containers
echo "Running containers after deployment:"
docker ps

echo "Done."