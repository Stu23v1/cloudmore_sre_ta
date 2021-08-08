# Temperature in Tallinn

## Goal

You need to provide the code to spin up a new server, install and configure Prometheus with Grafana. \
On the same server, you should write execute a task that would use public API to get current temperature in Tallinn and store it in Prometheus. \
Simple dashboard in Grafana must be provided to visualize temperature data. \
Program to get current temperature should be written by you.


### Required technology stack

 - GitHub to store the code
 - Azure cloud for the new server
 - Ubuntu 20.04 (or later) for the server
 - Latest stable version of Docker and Docker-compose
 - Latest stable version of Prometheus and Grafana
 - Terraform 0.14.x
 - Any scripting language is ok for the program code
 - Feel free to use additional tools for the automati

---

### How to

 - For infrastructure layer read - [README](infrastructure/README.md)
 - For application layer read - [README](app/README.md)

### Demo 

 - URL - [grafana-cloudmore.westeurope.cloudapp.azure.com](http://grafana-cloudmore.westeurope.cloudapp.azure.com/)

 - ![alt text](https://i.ibb.co/GnPwdy4/2021-08-08-22-09.png)


### Todo

- [ ] Split Infra and App to separate repos
- [x] Migrate to Terraform 1.x
  - [ ] Sub-task TBD
