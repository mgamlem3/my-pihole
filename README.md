# Pihole with Pihole-Cloudsync in Docker

## Overview
This project wraps the [pihole docker image](https://github.com/pi-hole/docker-pi-hole) with a [custom variant of pihole-cloudsync](https://github.com/mgamlem3/pihole-cloudsync) to enable setups with redundancy.

To learn how to configure Pihole or it's Docker image, please go read the [docs](https://docs.pi-hole.net). Likewise, to learn how to configure pihole-cloudsync, see the [README](https://github.com/mgamlem3/pihole-cloudsync#readme).

## Usage
1. Follow all setup instructions for pihole's docker image and pihole-cloudsync.
2. Change [Dockerfile]() to have appropriate `ENV` values for your setup.
3. Create a GitHub personal access token and place it in a file named `github-secret.txt` in the root of this repository.
	- It must have `repo` permissions
	- See GitHub's [docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) for how to create a personal access token.
4. Update `user.email` and `username` in [Dockerfile.primary]().
5. Run the `build.sh` script with a password for pihole as the first argument.
	- `./build.sh <password> <"primary"|"replica"|blank>`
	- The second argument can be omitted to build both `primary` and `replica` images or you may pass either version to build only one.
	- (Optional) Change the name of the image tag
6. Start the container with the `start.sh` script.
	- If you changed the tag name in the previous step you will need to update it in `start.sh`.

