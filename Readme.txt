## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Images/Cloud Diagram.jpg]

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - install-elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting access to the network.
-Load Balancers protect the Availabity side of security. If an outside attacker manages to get to one of your servers, the load balancer can cut off traffic to that server and can redirect it to another instead.
Utilizing a jump box gives us the advantage of using another machine in between our device and the servers we're connecting too.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat watches and monitors the log files or locations that users specify, collects log events.
- Metricbeat records and collects metrics from the operating system and from services running on the server.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| Web-1    | WebServer| 10.0.0.5   | Linux            |
| Web-2    | WebServer| 10.0.0.6   | Linux            |
| ELK      | LogServer| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 

Machines within the network can only be accessed by SSH.
- The machine that I allowed access to the ELK server is my personal workstation, at the time of setting up the ELK-NSG, the IP address was: 98.167.138.8

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 98.167.138.8         |
| Web 1    | No                  | 10.0.0.5             |
| Web 2    | No                  | 10.0.0.6             |
| ELK      | Yes                 | 98.167.138.8         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The main advantage of using Ansible is that you no longer after to configure each indivdual server. You can just run an ansible playbook to configure all at once.

The playbook implements the following tasks:
- Install docker.io
- Install pip3
- Install docker python module

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[Images/Screenshot 2021-03-17 154718]


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 
- Web 2

We have installed the following Beats on these machines:
- We installed filebeats on our server.

These Beats allow us to collect the following information from each machine:
- Filebeat is a log data shipper for local files. We installed it on our server and it monitors the log directorie/log files, tails the files, and sends them to Elasticsearch or Logstash for indexing. 
One examle is the logs produced from the MySQL database supporting our application.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file to the web VMs.
- Update the ansible/hosts file to include the IP address of the ELK server and web servers.
- Run the playbook, and navigate to http://(your elk public IP):5601/app/kibana to check that the installation worked as expected.

- The YAML file is the playbook and you copy it into the /etc/ansible/files/filebeat-config.yml directory.
- You have to update the filebeat-config.yml file to make Ansible run the playbook by specifying which machine it needs to be installed on with the host files and their IP addresses.
- In order to check to see if the ELK server is running, you need to go to http://(your elk public IP):5601/app/kibana.

