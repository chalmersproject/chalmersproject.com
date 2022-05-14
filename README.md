# chalmersproject.com

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

## TODO

- [ ] Asynchronously initialize Mapbox!

## Development

```bash
# Install required tools (OSX):
brew install rbenv ruby-build  # rbenv is a Ruby version manager
brew install volta             # volta is a Node version manager
brew install overmind          # overmind is a procfile runner
brew install --cask docker     # docker builds and runs containers

# Start background services:
docker compose up -d  # stop with `docker compose down`

# Set up system for development:
bin/setup

# Run app for development:
bin/dev
open http://localhost:3000 # in seperate terminal

# Attach to Rails app for debugging:
bin/attach # detach with [ctrl-b d]

# Format code:
bin/fmt [--check] <targets>

# Lint code:
bin/lint [--check] <targets>

# Generate RBIs for gems:
bin/tapioca gem <name>

# Generate RBIs for application:
bin/tapioca dsl

# Annotate models:
bin/annotate

# Show TODOs/FIXMEs/NOTEs, etc:
bin/rails notes

# Show routes:
bin/rails routes
```
