# schmidtWorkshop-docker
Builds a docker image out of the schmidtWorkshop repo

- Clone the repo, ensuring that the [R package repo](https://github.com/mcveanlab/schmidtWorkshop)
  is included as a submodule: ``git clone --recursive https://github.com/mcveanlab/schmidtWorkshop-docker.git``

- Build the docker image: ``sudo docker build -t bdi-rsf-workshop . --network host``.
  (The --network host is probably not needed in most cases, but it worked around 
  very tricky networking issues I was having during build.)

- Test out the docker image: ``sudo docker run -p 8888:8888 bdi-rsf-workshop``
