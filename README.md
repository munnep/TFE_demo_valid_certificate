# TFE_demo_valid_certificate

You will install a TFE latest version with valid certificates

# Diagram
The TFE server installation will connect to the internet to download and install necessary files. 

When the user wants to connect to TFE it will connect to the internet and route53 tp translate the DNS name to an ip address. Then it will connect to the TFE server which has a valid certificate for the DNS name and show a secure webpage. 

![](diagram/tfe_self_signed_certificate.png)


# Done

# To do  

- [ ] Vagrant box
- [ ] Generate valid TLS certificates with Let's encrypt
- [ ] Create Valid DNS record
- [ ] Create terraform settings.json file
- [ ] Create replicated.conf file
- [ ] terraform installation script
- [ ] First user automation