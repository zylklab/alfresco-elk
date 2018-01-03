# ELK setup for Alfresco
Kibana dashboards for monitoring Alfresco 5.x: System performance, Active Sessions and Alfresco Logs  

## Table of Contents
- [Introduction](#introduction)
- [ELK setup for Alfresco Community](#elk-setup-for-alfresco-community)
- [ELK setup for Alfresco Enterprise](#elk-setup-for-alfresco-enterprise)
- [Tested on](#tested-on)
- [Author](#author)
- [Links](#links)

## Introduction

TODO

## ELK setup for Alfresco Community

### Prerrequisites in Alfresco server

* Install OOTB Support Tool addon

### Configuration

* Install tools and startup scripts for Elastic, Kibana and Logstash.
* Install logstash input plugins (http-poller-input)
* Configure logstash client for Alfresco CE
  * OOTB http-poller-input config in logstash.conf
* Import searches, visualizations and dashboards in Kibana management.

### Available metrics via OOTB Support Tools webscripts

With [OOTB Support Tools addon for Alfresco Community Edition](https://github.com/OrderOfTheBee/ootbee-support-tools), it is possible to extract useful information about JVM, threads or logged users via webscript. We can use the JSON information from the available webscripts of the addon.

These metrics are available via logstash http-poller-input plugin:
- JVM Used memory
- Number of threads
- Number of active database connections
- Number of logged users
- Number of tickets
- System Load

## ELK setup for Alfresco Enterprise

### Prerrequisites in Alfresco server

* Enabling JMX in Alfresco server
 * -Dcom.sun.management.jmxremote in setenv.sh (java process)
 * alfresco.jmx.connector.enabled=true in alfresco-global.properties

For more details, you can check [Alfresco docs](https://docs.alfresco.com/5.0/tasks/jmx-access.html)

### Configuration

* Install tools and startup scripts for Elastic, Kibana and Logstash.
* Install logstash input plugins (jmx-input)
* Configure logstash client for Alfresco EE
  * JMX input config
  * Endpoint and available objects in jmx/jmx.conf
* Import searches, visualizations and dashboards in Kibana management.

### Available metrics via JMX

These metrics are available via logstash jmx input plugin:

- JVM Used memory
- Number of threads
- Number of active database connections
- Number of logged users
- Number of tickets
- Process Load
- System Load
- Number of File handlers
- Contentstore sizes
- SOLR numDocs

## Tested on

In your monitoring server:
* Elasticsearch (5.6.3)
* Kibana (5.6.3)

In Alfresco server:
* Logstash (5.6.3)

Tested with:
* Alfresco Content Services 5.2.0
* Alfresco Enterprise 4.2.6
* Alfresco Community 201707GA

## Author

- [Cesar Capillas](http://github.com/CesarCapillas)

## Links
- [OOTB Support Tools](https://github.com/OrderOfTheBee/ootbee-support-tools)
- [Blog Post - Kibana dashboard for monitoring Alfresco via JMX](https://www.zylk.net/es/web-2-0/blog/-/blogs/kibana-dashboard-for-monitoring-alfresco-jmx-metrics)
- [Blog Post - Kibana dashboard for monitoring Alfresco Logs](https://www.zylk.net/es/web-2-0/blog/-/blogs/simple-kibana-dashboard-for-monitoring-alfresco-logs)
- [Blog Post - Kibana dashboard for monitoring Alfresco Community via OOTB Support Tools](https://www.zylk.net/es/web-2-0/blog/-/blogs/kibana-dashboard-for-monitoring-alfresco-community-via-ootb-support-tools)
- [Blog Post - Enabling JMX in Alfresco](https://www.zylk.net/es/web-2-0/blog/-/blogs/enabling-jmx-in-alfresco)
- [Enabling JMX in Alfresco Enterprise](https://docs.alfresco.com/5.0/tasks/jmx-access.html)
- [Blog Post - Monitoring Alfresco in Nagios via OOTB Support Tools](http://www.zylk.net/es/web-2-0/blog/-/blogs/monitoring-alfresco-in-nagios-via-ootb-support-tools-addon)
- [Blog Post - More on monitoring Alfresco in Nagios via OOTB Support Tools](http://www.zylk.net/es/web-2-0/blog/-/blogs/more-on-monitoring-alfresco-in-nagios-via-ootb-support-tools)
