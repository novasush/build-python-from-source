#!/bin/bash

# ----------------------------------------------
# MIT License

# Copyright (c) 2020 Sushrut Ashtikar

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ----------------------------------------------
echo "Updating and installing build tools for python"
apt-get update -y
apt-get install -y build-essential checkinstall
apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
echo "Configure location for building python!"

read -p "Enter Full Path beginning from '/': " userpath

echo "Path selected by you is: $userpath"


if [ ! -d "$userpath" ]; then
  read -t 5 -p "Given path not found please make sure you give correct path...exiting"
  exit
fi

echo "Updating directory for building python"

cd $userpath

wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz

tar xzf Python-3.6.9.tgz
echo changing directory
cd Python-3.6.9

echo Compiling python please wait
./configure --enable-optimizations

echo building python
make altinstall

echo Done updating... Verifying installation from python version
python3.6 -V

read -p "Do you want to upgrade pip?(y/N)" decision

if [ "$decision" != "Y" ] && [ "$decision" != "y" ]; then
    exit
fi

echo "Upgrading pip..."
echo "Installing dependencies required by pip"

apt-get install -y python3-distutils python3-testresources

cd ~/

wget https://bootstrap.pypa.io/get-pip.py

echo "Installing pip....."
python3.6 get-pip.py


echo "Done with pip verifying pip installation from its version..."
pip3.6 -V

read -p "Do you want to me to update python path in bashrc file for running python3.6 using python command directly?(y/N)" decision

if [ "$decision" != "Y" ] && [ "$decision" != "y" ]; then
    exit
fi

echo 'alias python=python3.6' >> ~/.bashrc
echo 'alias pip=pip3.6' >> ~/.bashrc


echo "Done with python installation...."
exit
