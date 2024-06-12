#!/bin/bash
set -xu
sudo usermod -aG docker $USER && newgrp docker
