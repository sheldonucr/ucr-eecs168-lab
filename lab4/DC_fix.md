## Fix for Design Compiler

#### This document shows show to configure Design Compiler

Step.1: First find and open the `~/.bashrc` file under home folder by
```
vi ~/.bashrc
```

Step.2: Click 'i' to insert texts and add the following commands in the file,
```
export PATH="/usr/local/synopsys/syn/W-2024.09-SP5-4/bin/:$PATH"
```

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
`[1129]` Design Compiler works as expected, VCS and IC Compiler still requires IT support.