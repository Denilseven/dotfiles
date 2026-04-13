#!/bin/bash

projects_directory=~/Code/
project_name=$(ls -t $projects_directory | rofi -dmenu) && \
code $projects_directory$project_name

