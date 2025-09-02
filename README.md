# hello-vagrant

Trying Vagrant

Read blog post at: [https://thedreambook.github.io/blog/hello-vagrant/](https://thedreambook.github.io/blog/hello-vagrant/)

## Setup

Setup Lab

```sh
./devsetup.sh
```

## Tutorial

Vagrant up VM

```sh
./01-vagrant-up.sh
```

SSH into VM

```sh
./02-vagrant-ssh.sh
```

Reload VM after modify Vagrantfile

```sh
./03-vagrant-provision.sh
# OR
./04-vagrant-reload.sh
```

Pause and Resume VM

```sh
# PAUSE
./vagrant-suspend.sh
# RESUME
./vagrant-resume.sh
```

Verify sharing directory is working

```sh
./verify-shared.sh
```

Stop VM

```sh
./vagrant-halt.sh
```

Destroy VM

```sh
./vagrant-destroy.sh
```

Remove Vagrant Box

```sh
./vagrant-remove-box.sh
```

Up Nginx

```sh
./vagrant-up-nginx.sh
```

## Reference

[https://developer.hashicorp.com/vagrant/tutorials/get-started](https://developer.hashicorp.com/vagrant/tutorials/get-started)
