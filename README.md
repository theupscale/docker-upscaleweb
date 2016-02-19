upscale-docker-wordpress
======================



Out-of-the-box Wordpress docker image


Usage
-----

To create the image `theupscale/upscaleweb`, execute the following command on the tutum-docker-wordpress folder:

	docker build -t theupscale/upscaleweb .

You can now push your new image to the registry:

	docker push theupscale/upscaleweb


Running your Wordpress docker image
-----------------------------------

Start your image:

	docker run -d -p 80:80 theupscale/upscaleweb

Test your deployment:

	curl http://localhost/

You can now start configuring your Wordpress container!


More information
----------------

For details on how to access the bundled MySQL Server, set specific passwords or disable .htaccess,
