cd ..

git clone --depth 1 https://github.com/titzer/virgil

cd virgil

bin/dev/aeneas bootstrap

cd ..

export PATH=$PATH:$(pwd)/virgil/bin

make

bin/wizeng.x86-64-linux --help

bin/wizeng.v3i --expose=wizeng test/wizeng/hello.wasm

bin/wizeng.x86-64-linux --expose=wizeng test/wizeng/hello.wasm

bin/wizeng.x86-64-linux --expose=wali test/wasi/wasi_fd_write00.wasm

bin/wizeng.x86-64-linux --expose=wali test/wali/HelloWorld.wasm

time bin/wizeng.x86-64-linux --expose=wizeng test01/fib40_wizeng.wasm 

> 7.2s