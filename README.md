# about
> save all your SSH test connection settings in one place (_notice that I am using this only for test environments_)

> accepts SSH Private Keys (.pem) or username/passwords - see [connections.yml](connections.yml)

# prerequisites
* install [yq](https://mikefarah.github.io/yq/)
* install [sshpass](https://linux.die.net/man/1/sshpass)
* tested on MacOS

> you can install all of the above running:
```shell
$ make prereq
```

# usage
* update the [connections.yml](connections.yml) with your ssh connection details (the `command` will be executed interactively)
* run the Makefile with `make`
> all connection details will be displayed
```shell
$ make
These are the available connections.
0       - machine-A-with-pem
1       - machine-B-with-password
Please choose the number assigned to desired connection above?
```
* choose the machine that you want to connect to, typing the number related (e.g: 0 or 1 in this case)
* now you are logged in!
