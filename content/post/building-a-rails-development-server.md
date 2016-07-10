{
  "title": "Building a Rails development server",
  "date": "2011-06-06T00:00:00+01:00",
  "description": "An server stack to facilitate development against almost any Rails environment.",
  "tags": [
    "Rails"
  ]
}

At [pebble.code][2] where I work we have a Ubuntu 10.04 LTS server for our Rails and Ruby projects. We use this mostly internally but sometimes expose sites outside of our network to allow clients to quickly review work. When we started the business we built the Rails stack using the standard tools - [Apache][3] and [Passenger][4]. As our client list grew and we took on a couple of legacy projects we found that this stack no longer matched the environments that we were deploying too and didn't give us the flexibility we wanted. So here's how we changed it. 

## Promoting nginx to port 80

[Nginx][5] is quite simply an awesome web server. It is simple to configure, the memory footprint is small and it can be used to proxy traffic through the web server of our choice and can serve static assets like html, images and css directly before it hits the Rails app.

From having the ability to serve Rails sites only from Apache and Passenger we have moved to this.

![Nginx Proxy Diagram][1]

We've moved Apache to port 81 so if a site needs to be tested on that setup we can still do it. Otherwise we can proxy from nginx directly to Apache. The real flexibility comes from the server we use to serve the Rails app. We deploy by choice on [Thin][6] or [Unicorn][7] so we can replicate this stack easily. We are looking at [Goliath][8] at the moment so we could easily add this in beneath Nginx. We are playing with some other technologies like [Node.js][9] too. With Nginx we can support this too. 

## Getting nginx

If you want to make the switch on Ubuntu there is a PPA repo you can add 

    sudo -s
    nginx=stable # use nginx=development for latest development version
    add-apt-repository ppa:nginx/$nginx
    apt-get update 
    apt-get install nginx

If you are currently using Apache you'll need to decide whether or not to keep it on port 80. We switched Apache to port 81 and promoted Nginx to port 80.

## Example configs

The Ubuntu install uses `sites-available` and `sites-enabled` folders to allow you to create site configs. Here are some examples that you can use to get you started.

Logs are disabled in these examples. If you want logging just add a path to the log file. 

### Default proxy settings

To keep your Nginx configs nice and DRY you can add a file to hold common proxy settings under `/etc/nginx/conf.d` called in my case proxy.conf

    proxy_redirect     off;

    proxy_set_header   Host             $host;
    proxy_set_header   X-Real-IP        $remote_addr;
    proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
    proxy_max_temp_file_size 0;

    client_max_body_size       10m;
    client_body_buffer_size    128k;

    proxy_connect_timeout      90;
    proxy_send_timeout         90;
    proxy_read_timeout         90;

    proxy_buffer_size          4k;
    proxy_buffers              4 32k;
    proxy_busy_buffers_size    64k;
    proxy_temp_file_write_size 64k;

### Proxy to Apache

This expects that you have setup an Apache virtual host on port 81.

    server {
        listen       80;
        server_name  site1.com;

        access_log  off;
        error_log off;

        location / {
            proxy_pass         http://127.0.0.1:81/;
        }
    }

### Proxy to Thin

    upstream thin {
        server unix:/var/www/vhosts/site2.com/httpdocs/current/tmp/sockets/thin.0.sock;
    }
    server {
        listen       80;
        server_name  site2.com;

        access_log  off;
        error_log off;

        location / {
            proxy_pass         http://thin;
        }
    }

### Proxy to Unicorn

    upstream unicorn {
        server unix:/var/www/vhosts/site3.com/httpdocs/current/tmp/sockets/unicorn.sock fail_timeout=0;
    }
    server {
        listen       80;
        server_name  site3.com;

        access_log  off;
        error_log off;

        location / {
            proxy_pass         http://unicorn;
        }
    }

## So which one is best?

Having played a fair bit recently with servers to serve up Rails apps there isn't a clear answer I'm afraid. I may get round to publishing my rudimentary benchmarks but I've found that for low memory deployments Nginx and Thin is a great choice. The response times are excellent and memory usage is much lower than Passenger or Unicorn. Thin doesn't come with the same in-built load balancing that you get with Unicorn so [HAProxy][10] comes in to play here. HAProxy is another piece in the stack though which may put some off. 

If memory isn't an issue then Unicorn behind Nginx is a great choice. The rolling deployments are a great feature, but you also get free load balancing with Unicorn thanks to the [power of UNIX][11]. 

If you are not interested in memory or tweaking you are probably best with Passenger behind Nginx. 

If you are not interested in doing any sys admin work use [Heroku][12], [EngineYard][13] or [Brightbox][14].

## Conclusion

If you are rolling your own servers and using Apache switch to Nginx!

[1]: https://shapeshed.com/images/articles/nginx_proxy_diagram.png
[2]: http://pebblecode.com/
[3]: http://www.apache.org/
[4]: http://www.modrails.com/
[5]: http://wiki.nginx.org/
[6]: http://code.macournoyer.com/thin/
[7]: http://unicorn.bogomips.org/
[8]: http://postrank-labs.github.com/goliath/
[9]: http://nodejs.org/
[10]: http://haproxy.1wt.eu/
[11]: http://tomayko.com/writings/unicorn-is-unix
[12]: http://www.heroku.com/
[13]: http://www.engineyard.com/
[14]: http://www.brightbox.co.uk/
