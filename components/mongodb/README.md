kubectl kustomize --enable-helm components/mongodb | kubectl apply --filename -

# Connect to database

mongosh --username admin --password pass --host localhost
or 
mongo --host localhost -u admin -p pass --authenticationDatabase admin test

# Connection string

mongodb://[<username>:<password>@]hostname0<:port>[,hostname1:<port1>][,hostname2:<port2>][...][,hostnameN:<portN>]

# Mongodb commands

https://gist.github.com/bradtraversy/f407d642bdc3b31681bc7e56d95485b6
