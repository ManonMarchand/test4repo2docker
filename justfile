set shell := ["bash", "-c"]

write-dockerfile:
    jupyter-repo2docker --no-build --debug . > Dockerfile
run-docker:
    docker run -it -p 8888:8888 $(docker images | awk '{print $1}' | awk 'NR==2')
push-on-gitlab:
    #!/usr/bin/env bash
    docker login gitlab.cds.unistra.fr:5050
    docker tag $(docker images | awk '{print $1}' | awk 'NR==2'):latest gitlab.cds.unistra.fr:5050/manon.marchand/dockers-for-notebooks:ipyaladin
    docker push gitlab.cds.unistra.fr:5050/manon.marchand/dockers-for-notebooks:ipyaladin
