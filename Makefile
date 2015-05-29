main:
	true

up: clean php_app rails_app nginx logs

clean:
	-sudo docker ps -aq | xargs sudo docker rm -f

nginx:
	sudo docker run --name nginx -itd --net=host -v /vagrant/nginx.conf:/etc/nginx/nginx.conf:ro nginx:1.9.1

php_app:
	sudo docker run --name php-app -itd --net=host -v /vagrant/php-app:/php-app -w /php-app php:5.6.9-cli php -S 0.0.0.0:9000 index.php

rails_app:
	sudo docker run --name rails-app -itd --net=host -v /vagrant/rails-app:/rails-app -w /rails-app rails:4.2.1 bash -c 'bundle install && rails server -b 0.0.0.0 -p 3000'

logs:
	sudo docker logs -f nginx
