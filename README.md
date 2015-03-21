# SRCompBox 2015

This is the configuration for the SR 2015 Competition VM.

It's a lightweight Vagrant wrapper around a puppet config.

Note: to simplify deployment on the day, the default Vagrant logins are
disabled by the puppet run. If you want to be able to access the machine
you create then you should add one of the public keys for the private
keys specified in `config.ssh.private_key_path` to
 `modules/compbox/files/vagrant-authorized_keys`.

Once the machine is up and running, you should be able to see the pages
it serves via <http://localhost:8080> and there is a test script which
will validate them: `./check-pages.py`.
