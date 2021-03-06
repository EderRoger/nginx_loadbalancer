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

#Config mongo replicasets

``vagrant ssh db``<br>
``mongo``<br>
``rs.initiate()``<br>
``rs.conf()``<br>
``rs.add("mongo1.replica.com")``<br>
``rs.add("mongo2.replica.com")`` 


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
<br>



Open your web browser and access: http://192.168.33.13/app/#/people or<br>
open the shell and execute benchmark testing. The following code execute 500 requests try it :) and look the servers responding:<br>

``ab -c 40 -n 500 http://192.168.33.13/``<br>

Look each terminal and see loadbalancing in action.


![alt tag](https://raw.githubusercontent.com/EderRoger/nginx_loadbalancer/master/files/loadbalacing.png)

#Replica set terminal:

![alt tag](https://raw.githubusercontent.com/EderRoger/nginx_loadbalancer/master/files/replicaset_mongo.png)
