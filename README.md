# nginx_loadbalancer
Vagrant provisioning with puppet creating 4(servers)  to testing nginx upstream load balacing

 Inner project example https://github.com/EderRoger/AngularMongo

 Install Vagrant

 add the box   

vagrant box add hashicorp/precise32 http://files.vagrantup.com/precise32.box

# configure AngularMongo App environment to load on vagrant machines
cd AngularMongo

sudo npm install

bower install


vagrant up
