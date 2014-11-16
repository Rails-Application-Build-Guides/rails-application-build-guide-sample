#!/bin/bash
bundle exec unicorn_rails -c config/unicorn.rb -p 3000 -E development
