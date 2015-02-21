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

![alt tag](http://www.keko.com.br/blog/wp-content/uploads/2013/01/Lamborghini-Aventador_keko-acess%C3%B3rios_keko_acess%C3%B3rios_carros-1.jpg)