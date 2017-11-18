
# Example of docker .env file override

Look at `.env` file - it contain variable `DOCKER_ENV` which rule to include one of `.env.prod` or `.env.dev`

Just run:

	$ docker-compose up
	Recreating dockercompose_some_1 ...
	Recreating dockercompose_some_1 ... done
	Attaching to dockercompose_some_1
	some_1  | DOCKER_ENV_VAR=development
	dockercompose_some_1 exited with code 0


And off course you may easy redefine it on start:

	$ DOCKER_ENV=prod docker-compose up
	Recreating dockercompose_some_1 ...
	Recreating dockercompose_some_1 ... done
	Attaching to dockercompose_some_1
	some_1  | DOCKER_ENV_VAR=production
	dockercompose_some_1 exited with code 0

## Unfortunately it works ONLY for variables into container

And it can *NOT* be used in docker-compose itself, f.e. for PORT or volumes specification. See [@issue 3435](https://github.com/docker/compose/issues/3435)

## Workaround
But [see workaround.bash…](https://github.com/docker/compose/issues/3435#issuecomment-272681399)

    set -a && . .env.dev && docker-compose up

And vuola:

    $ http --body http://localhost:7000
    Dev env index

