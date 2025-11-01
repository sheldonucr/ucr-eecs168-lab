## ICV fix for DRC

#### This document shows show to configure IC Validator for running DRC and LVS

Step.1: First find and open the `~/.bashrc` file under home folder by
```
vi ~/.bashrc
```

Step.2: Click 'i' to insert texts and add the following commands in the file,
```
export PATH="/usr/local/synopsys/icvalidator/V-2023.12-SP5-13/bin/linux64:$PATH"
export ICV_HOME_DIR=/usr/local/synopsys/icvalidator/V-2023.12-SP5-13
export SNPSLMD_LICENSE_FILE=27000@synopsys.engr.ucr.edu
export LM_LICENSE_FILE=$SNPSLMD_LICENSE_FILE
```

You can also add
```
export SAED90_PDK =/usr/local/synopsys/pdk/SAED90nm_PDK_10222017
```
in Lab 1 into the `bashrc` file.

After adding these commands press ':wq' to save and quit the `~/.bashrc`

Step.3: Run
```
source ~/.bashrc
```
to enable the environment variables.

*** Each time we log into Bender please run *** 
```
source ~/.bashrc
```


### Follow-ups and modofication
`[1031]` Currently DRC should work properly. However, we found that when running LVS there may be an error related to device resource. We are actively working on this.