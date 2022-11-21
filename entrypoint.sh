#!/bin/sh
rake db:migrate
rake db:seed
rake stripe:products:create
rails s $@
