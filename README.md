This project is no longer actively supported by NGA as of 3/24/2015.  Feel free to re-use code or take whatever parts you need. 

RFI Generator chef installer
============================
The RFI Generator Chef Installer software was developed at the National Geospatial-Intelligence Agency (NGA) in collaboration with [NJVC](http://www.njvc.com/).  The government has "unlimited rights" and is releasing this software to increase the impact of government investments by providing developers with the opportunity to take things in new directions. The software use, modification, and distribution rights are stipulated within the MIT license.

Software source code previously released under an open source license and then modified by NGA staff is considered a "joint work" (see 17 USC § 101); it is partially copyrighted, partially public domain, and as a whole is protected by the copyrights of the non-government authors and must be released according to the terms of the original open source license.

###Vagrant/chef installer for a RFI Generator development environment

*Tested with Vagrant 1.6.2 and vagrant-omnibus 1.4.1 on OSX and Ubuntu 14.04.  Ensure you've checked out the rfi-generator source code alongside this repository.*

Install vagrant from vagrantup.com

```bash
vagrant plugin install vagrant-omnibus
```

Create an RVM to house your gems

```bash
bundle
librarian-chef install
vagrant up
```

After your VM has been provisioned, hit http://192.168.33.10:9000 to view the RFI Generator
