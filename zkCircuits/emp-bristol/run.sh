docker build -t circ .
id=$(docker create circ)
docker cp $id:/emp-tool/matmul64.txt circuits/
docker cp $id:/emp-tool/matmul_file.h circuits/
docker rm -v $id