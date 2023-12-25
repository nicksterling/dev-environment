## Assuming args[--env] contains something like "A=value B=anotherValue"
env_values="${args[--env]}"

## Create or clear the .env file
> .env-tmp

## Split the env_values string and process each variable
IFS=' ' read -ra ADDR <<< "$env_values"
for val in "${ADDR[@]}"; do
    ## Remove potential surrounding quotes from each variable
    val=${val//\"/}
    
    ## Write the processed variable to the .env file
    echo $val >> .env-tmp
done

## Use the .env file with docker-compose
docker-compose  --env-file .env-tmp up -d

## Remove the .env-tmp file
rm .env-tmp