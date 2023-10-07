https://github.com/kube-hetzner/terraform-hcloud-kube-hetzner

https://news.ycombinator.com/item?id=35260141
https://github.com/hetznercloud/awesome-hcloud/

S3 alternatives:
https://www.backblaze.com/cloud-storage/pricing


# Option 1:
	
It's not even close to major public cloud providers, but this is my setup:
* https://github.com/kube-hetzner/terraform-hcloud-kube-hetzne... (Terraform, Kubernetes bootstrap)

* Flux for CI

* nginx-ingress + Hetzner Loadbalancer (thanks to https://github.com/hetznercloud/hcloud-cloud-controller-mana...)

* Hetzner storage volumes (thanks to https://github.com/hetznercloud/csi-driver)

Kube-Hetzner supports Hetzner Cloud loadbalancers and volumes out of the box, though it also supports other components.


# Option 2:

> 50 machines at hetzner
- install machines with ansible (using hetzner scripts for OS install)

- machines communicate over vswitch/vlans, external interfaces disabled whenever possible. Pay attention to the custom mtu trick.

- harden machines, unattended-upgrades mandatory on each machine

- ssh open with IP whitelists from iptables on gateways

- machines organized as k8s clusters, took ~1 year to have everything working cleanly

- everything deployed as k8s resources (kustomize, fluxcd, gitops)

- use keepalived for external IPs with floating IPs for ingress on 3 machines per cluster

Machines are managed as cattle, it takes <1h+ hetzner provisioning time to add as many machines as we need.

# Option 3:

It really depends a lot on what you get from Hetzner. Their cloud offerings are kinda weird (few features, high prices), so we buy dedicated servers and run our own containers on top of that.
Deploy from source: Gitlab CI builds and deploys containers

Keep software uptodate: Deploy new containers / migrate all containers from a host to upgrade that with OS tools (Debian for us, so just apt dist-upgrade)

Load balancing: nginx container

Scaling: Hasn't really been an issue for us yet, but terraform/k8s work fine from what I've heard

Backups: Dedicated SX server pulls backups via rsnapshot, including DB dumps. All data is on minutely replicated ZFS pools, so we got short-term snapshots for free anyway.

Security: Still on IPTables and Fail2ban for on-system stuff. DDoS protection from Hetzner itself is okay-ish, but for really critical sites Akamai or Cloudflare are still the safer choices. Both work fine.

# Option 4:
Migrated from Linode to Hetzner. My workflow has stayed the same:
* Deploying using Git and Capistrano: `git push && cap production deploy` (aliased to cpd)

* Using Hetzner backups + daily backups to Tarsnap using cron

* Updating software by SSH-ing into a server and updating apt packages; I update Ruby gems locally

* For security, built-in firewall + ufw, two-factor authentication, public key-only authentication (SSH key is protected with a password), SSH running on a non-standard port with a non-standard username.

* I use sqlite as a database and caddy as a web server


# Option 5:
- deploy from source repo? Github copy Go binary 
- keep software up to date? Using Hetzner Cloud + hosted Postgres
- do load balancing? Hetzner LB + DNSMadeEasy LB failover
- handle scaling? I don't need to scale fast
- automate backups? Snapshots + hosted Postgres
- maintain security? SSH on other port, Hetzner private networks, built-in firewall and DDoS protection

