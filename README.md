# Docker-dev-env

A linux container for local builds+tooling+development.

## Why's it so big?

It's meant to replace my old base `vagrant` linux box for quick tests or builds under linux. The size is still smaller than a full-blown VM, and it's a lot faster to get running. Specific development versions can be kept by running `docker commit`, and then later removed when not needed.
