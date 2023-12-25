if ! docker image inspect nicksterling/wt-gui-builder:${version} &> /dev/null; then
    echo "Building nicksterling/wt-gui-builder:${version}"
    ## Define the Dockerfile in a variable by concatenating lines
    dockerfile="FROM alpine:latest\n"
    dockerfile+="RUN apk add --no-cache bash jq\n"

    docker buildx build --platform linux/amd64 -t nicksterling/wt-gui-builder:${version} ./.gui --load
fi

## Todo: This command always uses the amd64 platform. I need to make it smarter so
##  it uses the platform that the user is running on if possible. The reason I'm 
##  using the amd64 platfrom is because wine has issues building x64 binaries using the 
##  arm64 container. I'm not sure if this is a wine issue or a docker issue.
docker run --rm --platform linux/amd64 -it -v $(pwd)/.gui/bin:/app/bin nicksterling/wt-gui-builder:${version} npx electron-packager . webtop-gui --platform=${args[--os]} --arch=${args[--arch]} --out=./bin --overwrite    


