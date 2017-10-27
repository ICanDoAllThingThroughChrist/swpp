[11:22:42] (master) swpp $ git add .
[11:27:30] (master) swpp $ git commit -m "test2 deployment"
[master 8a01417] test2 deployment
 1 file changed, 1 insertion(+)
[11:27:43] (master) swpp $ git push deployment master

"read following screenshot"
https://plnkr.co/edit/NaMElx34bE2FU3vKrFCB?p=preview

"Open post-receive to read script"
#!/bin/bash
git --work-tree=/home/whysavewickd/webapps/swpp/deployed reset --hard HEAD
git --work-tree=/home/whysavewickd/webapps/swpp/deployed clean -xfd



cd /home/whysavewickd/webapps/swpp
export GEM_HOME=$PWD/gems
export RUYBLIB=$PWD/lib
export PATH=$PWD/bin:$PATH
source ~/.bash_profile


cd deployed
rm Gemfile.lock 
bundle install
rake db:migrate 


cd .. 
./bin/restart
