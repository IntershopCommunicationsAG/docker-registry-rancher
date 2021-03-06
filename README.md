 [![Docker Stars](https://img.shields.io/docker/stars/intershopde/docker-registry-rancher.svg?style=plastic)](https://registry.hub.docker.com/v2/repositories/intershopde/docker-registry-rancher/stars/count/) [![Docker pulls](https://img.shields.io/docker/pulls/intershopde/docker-registry-rancher.svg?style=plastic)](https://registry.hub.docker.com/v2/repositories/intershopde/docker-registry-rancher/)
[![Docker Automated build](https://img.shields.io/docker/automated/intershopde/docker-registry-rancher.svg?maxAge=2592000?style=plastic)](https://github.com/IntershopCommunicationsAG/docker-registry-rancher/)

# Artifactory Docker Registry Proxy

This image configures a nginx reverse proxy (using confd with Rancher as backend) as docker-registry for Artifactory repositories.

Artifactory Server URL and Docker Repository Name are configurable.
This is used with Rancher 1.

# Example Rancher configuration

`docker-compose.yml`:

```
version: '2'
services:
  docker-registry:
    image: intershopde/docker-registry-rancher:nginx1.16.0-alpine
    stdin_open: true
    tty: true
    labels:
      io.rancher.container.pull_image: always
```

`rancher-compose.yml`:

```
version: '2'
services:
  docker-registry:
    metadata:
      nginx:
        conf: "#additional custom configuration"
      artifactory:
        proxyUrl: http://example.com:8081/artifactory/
        bindPort: 8080 # default: 80
        dockerRepoName: docker-repo
    scale: 1
    start_on_create: true
```

# License

Copyright 2014-2017 Intershop Communications.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

## Third-party License nginx

Dockerhub: https://hub.docker.com/_/nginx/

```
Copyright (C) 2011-2016 Nginx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
```

## Third-party License confd

Github: https://github.com/kelseyhightower/confd

Licensed under the MIT license.

```
Copyright (c) 2013 Kelsey Hightower

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
