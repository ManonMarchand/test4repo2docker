write-dockerfile:
    jupyter-repo2docker --no-build --debug . > Dockerfile
run-docker:
    docker run -it -p 8888:8888 [tag]
