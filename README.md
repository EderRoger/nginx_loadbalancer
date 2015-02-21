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

#Open the shell 1:
``vagrant ssh server1``

``cd /vagrant/AngularMongo``

``npm start``

#Open the shell 2:
``vagrant ssh server2``

``cd /vagrant/AngularMongo``

``npm start``

#Open the shell 3:
``vagrant ssh server3``

``cd /vagrant/AngularMongo``

``npm start``

# Open the shell 4:

``vagrant ssh server4``

``sudo service nginx start
``

Open your web browser and access: http://192.168.33.13/app/#/people

and look each terminal and see loadbalancing in action.

To execute benchmark testing run this command executin 500 requests try it :) and look the servers responding:

ab -c 40 -n 500 http://192.168.33.13/

![alt tag](https://raw.githubusercontent.com/EderRoger/nginx_loadbalancer/master/files/loadbalacing.png)
