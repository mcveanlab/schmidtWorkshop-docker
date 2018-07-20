# schmidtWorkshop-docker
Builds a docker image out of the schmidtWorkshop repo

- Clone the [main repo](https://github.com/mcveanlab/schmidtWorkshop) so that it's
  in the same directory as the Dockerfile.

- Build the docker image: ``sudo docker build -t bdi-rsf-workshop . --network host``.
  (The --network host is probably not needed in most cases, but it worked around 
  very tricky networking issues I was having during build.)

- Test out the docker image: ``sudo docker run -p 8888:8888 bdi-rsf-workshop``
