#!/bin/bash
# ref: https://github.com/multiarch/qemu-user-static
# run docker in different archtectures by QEMU and binfmt_misc

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

echo "Try: docker run --rm -t arm64v8/ubuntu uname -m"
echo "More Info: https://github.com/multiarch/qemu-user-static"
