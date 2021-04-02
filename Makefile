all: nopath path dynamic

mymath: mymath.c
	gcc -shared -o libmymath.so -fPIC $< -lm

nopath: mymath main.c
	gcc -o $@ main.c -lmymath -L./

path: mymath main.c
	gcc -o $@ main.c -lmymath -L./ -Wl,-rpath=/tmp/shared_lib

dynamic: dynamic.c
	gcc -o $@ $< -ldl

clean:
	rm libmymath.so path nopath dynamic
