% Vagrant
% Zaki Mughal, CougarCS, University of Houston
% 2013-09-12

# Questions

> - who knows what a VM is?
> - ...used a VM?

# Vagrant

> - spin up virtual machines
> - save your dependencies
> - share your dev environment
>   - "But it works on my computer"
    - Never again.
> - Want to run the code? Just hand over the Vagrantfile.

----

- CLI-based
- need VirtualBox <https://www.virtualbox.org/>
  - default VM provider
- install Vagrant <http://www.vagrantup.com/>
  - installers and packages

    ```bash
    $ apt-get install vagrant # for Debian / Ubuntu
    ```

# Let's get started

```bash
[ host ] $ mkdir my-cool-project && cd my-cool-project
	# make a project directory and change in to it

[ host ] $ vi cool_script; chmod +x cool_script
    # some code!
```

----

# Building the VM

```bash
[ host ]$ vagrant init precise32 http://files.vagrantup.com/precise32.box
	# this will create Vagrantfile and use precise32.box as our base image

[ host ] $ vagrant up
	# build our VM! (takes ~5 minutes the first time as we download
	# the box over the network)
	# 
	# It'll be faster next time because it will be saved.
```

----

# Logging in

```bash
[ host ] $ vagrant ssh
	# Woot! We have a prompt!

[ vagrant ] $ ls /vagrant/
     # Our files!

[ vagrant ] $ ./cool_script
	# Yay! It runs!
```

----

# Shared directory

```bash
[ vagrant ] $ touch foobar; exit
	# create a file


[ host ] $ ls
	# and it's over here too!
```

----

# Done for the day

```bash
[ host ] $ vagrant suspend
	# save state of memory

# Have you tried turning off and on again?
[ host ] $ vagrant halt
	# shut down
```


---

Kill it with fire!

```bash
[ host ] $ vagrant destroy
    # VM go bye-bye
```

Tabula rasa

```bash
[ host ] $ vagrant up
	# builds it up again
```

---

# Vagrantfile (aka the magic!)

Let's take a look

- networking (port forward)

- configuration management
  - we can have a shell script
    - <http://docs.vagrantup.com/v2/provisioning/shell.html>

----

Vagrantfile

```ruby
Vagrant.configure("2") do |config|
#  ...
  config.vm.provision "shell", path: "provision-vm.sh"
#  ...
end
```

# provision-vm.sh

```bash
#!/bin/sh

apt-get update
apt-get --no-install-recommends -y install apache2 # install web server
rm -Rf /var/www # remove www directory contents (don't put a / at the end!)
ln -fs /vagrant /var/www # point www directory to Vagrant
```

----

# More

- Grab some custom VM images <http://www.vagrantbox.es/>
  - different Unix distros
  - different tools: git, MySQL, MongoDB
- look at what boxes you have

```bash
$ vagrant box list
```

- Multimachine
  - web server and DB server
  - <http://docs.vagrantup.com/v2/multi-machine/>

