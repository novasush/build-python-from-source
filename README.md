# build-python-from-source
Shell script for building python from source...


## Steps for running:

### Step 1: Download shell file from terminal
```bash
wget https://github.com/novasush/build-python-from-source/blob/master/build_python.sh
```

### Step 2: Give executable permission to `build_python.sh`
```bash
chmod +x build_python.sh
```

### Step 3: Run file with sudo permission
```bash
sudo ./build_python.sh
```

### Step 4: You will be prompted for specifying build location enter full path where you want to build python.

```bash
Enter Full Path beginning from '/': /usr/src

Path selected by you is: /usr/src
```

### (Optional)

The python version i have used in this file is python3.6.9 if you wish to change version, edit the file and update following lines with the python version you wish to install in `build_python.sh`

```bash
#line 46
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz

#line 48
tar xzf Python-3.6.9.tgz

#line 50
cd Python-3.6.9

#line 59
python3.6 -V

#line 77
python3.6 get-pip.py

#line 81
pip3.6 -V

#line 89 and 90
echo 'alias python=python3.6' >> ~/.bashrc
echo 'alias pip=pip3.6' >> ~/.bashrc
```

