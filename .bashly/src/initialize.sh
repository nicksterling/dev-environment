# ## Check if Docker is installed
# if ! command -v docker &> /dev/null; then
#     echo "Error: Docker is not installed"
#     exit 1
# fi

# ## Check to see if the nicksterling/wt-helper image with tag ${version} exists
# ##  If it does not exist, then let's build it
# if ! docker image inspect nicksterling/wt-helper:${version} &> /dev/null; then
#     echo "Building nicksterling/wt-helper:${version}"
#     ## Define the Dockerfile in a variable by concatenating lines
#     dockerfile="FROM alpine:latest\n"
#     dockerfile+="RUN apk add --no-cache bash jq\n"

#     ## Build the Docker image using the Dockerfile from the variable
#     echo -e "$dockerfile" | docker build -t nicksterling/wt-helper:${version} -
#     if [ $? -ne 0 ]; then
#         echo "Failed to build nicksterling/wt-helper:${version}"
#         exit 1
#     fi
# fi
