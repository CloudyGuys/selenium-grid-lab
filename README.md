### Setup
This setup assumes you have Vagrant installed locally and uses VirtualBox as the provider.
* vagrant up

### Configuring Putty to connect to a Vagrant VM.
* Generating the ppk key
  * Using PuttyGen convert the %USERPROFILE%\.vagrant.d\insecure_private_key to a .ppk file
  * https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Connect-to-Your-Vagrant-Virtual-Machine-with-PuTTY

* Configuring Putty
  * Run vagrant ssh-config -- note the username, host, and port and add them to the fields below:
  * Under "Session" configure the host and port 
  * Under "Connection \ Data" configure the "Auto-login username"
  * Under "Connection \ SSH \ Auth" configure the "Private key for authentication" with the key you generatede