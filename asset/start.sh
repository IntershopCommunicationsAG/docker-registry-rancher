#!/usr/bin/env sh
#
# Copyright 2015 Intershop Communications AG.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#  limitations under the License.
#

set -eo pipefail

# TODO: add timeout with exception

# Loop until confd has updated the nginx config
until confd -onetime -backend rancher; do
  echo "[nginx-confd] waiting for confd to refresh nginx conf"
  sleep 5
done

# Start nginx
echo "[nginx-confd] starting nginx service..."
nginx -g "daemon off;"
