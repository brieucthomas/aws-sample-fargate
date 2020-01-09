# AWS Fargate Sample

## Required Tools

*  [AWS CLI](https://docs.aws.amazon.com/fr_fr/cli/latest/userguide/cli-chap-install.html)
*  [Pipenv](https://pipenv.kennethreitz.org/en/latest/#install-pipenv-today)

## Installation

```
# Install the pyhton packages
$ pipenv install

# Apply pre-commit hook on your git folder
$ pipenv run pre-commit install
```

### Configuration

The Makefile configuration file must be named `.env` and placed in the root of your source directory.

You can copy from the dist file:

```
$ cp .env.dist .env
```

Replace these values with your keys:

```
AWS_ACCESS_KEY_ID=your_access_key_id
AWS_SECRET_ACCESS_KEY=your_secret_access_key
```

Then, test your configuration:

```
$ make me
```

You'll see your configured account.

## Deploy

Deploy the stack:

```
$ make deploy
```

## Cleanup

Remove all resources:

```
$ make tear-down
```
