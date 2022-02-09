# TFE_demo_valid_certificate

This repository does an automated installation of TFE (Terraform Enterprise) on an Ubuntu virtual machine using valid certificates. 

This repository is based on the official HashiCorp documentation. [See documentation](https://www.terraform.io/enterprise/install/automated/automating-the-installer)


# Diagram
The TFE server installation will connect to the internet to download and install necessary files. 

When the user wants to connect to TFE it will connect to the internet and route53 to translate the DNS name to an ip address. Then it will connect to the TFE server which has a valid certificate for the DNS name and show a secure webpage. 

![](diagram/tfe_self_signed_certificate.png)

This repo uses Vagrant to create a virtual machine.

Vagrant virtual machine:
- ubuntu virtual machine starts
- TLS/SSL certificates should be created and stored under ```certificates/```
- TFE settings file can be found here ```config/tfe_settings.json```
- Replicated configuration file can be found here ```config/replicated.conf```
- TFE installation script will be downloaded and executed
- the first admin user will be created within TFE to use with settings from ```config/create_tfe_user.json```

For a manual installation of TFE follow [this documentation](manual/README.md) 

# Prerequisites

## Vagrant
Vagrant [See documentation](https://www.vagrantup.com/docs/installation)  
Virtualbox [See documentation](https://www.virtualbox.org/wiki/Downloads)

## License
- Make sure you have TFE license available for use and store it as ```config/license.rli```

## Valid certificates
- Make sure you have valid certificates and store these under ```certificates/``` in the format
    - privkey.pem
    - fullchain.pem
- a dns record pointing to ```192.168.56.33``` this repository used dns name ```patrick-tfe.bg.hashicorp-success.com```


See manual [Create certificates](create_certificate/README.md)



# How to
- Clone the repository to your local machine
```
git clone https://github.com/munnep/TFE_demo_valid_certificate.git
```
- Go to the directory
```
cd TFE_demo_valid_certificate
```
- save the license file as ```config/license.rli```
- save the certificate files under ```certificates/```
    - privkey.pem
    - fullchain.pem
- Start a virtual machine with Vagrant (duration 10 minutes)
```
vagrant up
```
- You should see the following message when Vagrant has started the Virtual machine
- Case of the repository the DNS name used is ```patrick-tfe.bg.hashicorp-success.com```
```
    default: #######################################################################
    default: #              TFE installation complete                              #
    default: # TFE dashboard: https://patrick-tfe.bg.hashicorp-success.com:8800    #
    default: # TFE Application: https://patrick-tfe.bg.hashicorp-success.com       #
    default: #######################################################################

```
- login to the replicated console page
[https://patrick-tfe.bg.hashicorp-success.com:8800](https://patrick-tfe.bg.hashicorp-success.com:8800)
- Unlock the console with the password ```Password#1```
- You should see that everything is started.
- Click on the open link which should point you to the TFE application [https://patrick-tfe.bg.hashicorp-success.com](https://patrick-tfe.bg.hashicorp-success.com)  
- login using the created account
```
user: admin
password: Password#1
```
- Halt the vagrant machine for later startup and use
```
vagrant halt
```
- When you are completely done you can remove it
```
vagrant destroy
```

# Done
- [x] Vagrant box
- [x] Generate valid TLS certificates with Let's encrypt
- [x] Create Valid DNS record
- [x] Create terraform settings.json file
- [x] Create replicated.conf file
- [x] tfe installation script
- [x] First user automation

# To do  
