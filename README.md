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

``ab -c 40 -n 500 http://192.168.33.13/``

See the output example:

edblack :: ~ » ab -c 40 -n 1000 http://192.168.33.13/22
This is ApacheBench, Version 2.3 <$Revision: 1604373 $>

Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.168.33.13 (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests


Server Software:        nginx/1.1.19
Server Hostname:        192.168.33.13
Server Port:            80

Document Path:          /
Document Length:        586 bytes

Concurrency Level:      40
Time taken for tests:   19.365 seconds
Complete requests:      1000
Failed requests:        0
Non-2xx responses:      1000
Total transferred:      931630 bytes
HTML transferred:       586000 bytes
Requests per second:    51.64 [#/sec] (mean)
Time per request:       774.590 [ms] (mean)
Time per request:       19.365 [ms] (mean, across all concurrent requests)
Transfer rate:          46.98 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    1   1.1      0      14
Processing:    62  764 875.1    473    3783
Waiting:       62  763 874.8    473    3783
Total:         65  764 875.3    474    3784

Percentage of the requests served within a certain time (ms)
  50%    474
  66%    525
  75%    560
  80%    623
  90%   2198
  95%   3301
  98%   3573
  99%   3649
 100%   3784 (longest request)


![alt tag](https://raw.githubusercontent.com/EderRoger/nginx_loadbalancer/master/files/loadbalacing.png)
