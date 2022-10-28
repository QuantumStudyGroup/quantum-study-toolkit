#!/bin/bash

git config --global --add safe.directory /home/jovyan/work
git config --global --unset http.sslbackend 
echo 'Goto http://localhost:8888 and use token' 