#!/bin/bash
set -xu
sudo usermod -aG docker $USER 
sudo newgrp docker
