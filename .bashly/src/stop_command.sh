## If ${args[--delete-volumes]} is true, then delete the volumes
if [[ "${args[--delete-volumes]}" == 1 ]]; then
    docker compose down -v
else
    docker compose down
fi