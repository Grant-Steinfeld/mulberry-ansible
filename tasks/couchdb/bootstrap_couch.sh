#!/usr/bin/env bash

# remove admin party
curl -X PUT http://127.0.0.1:5984/_config/admins/rhada -d '"pup"'
