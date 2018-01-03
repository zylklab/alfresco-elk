#!/bin/bash
##
## Script for logstash agent
##

# Logstash agent directory
export logstashAgentDir=/opt/elk/logstash-agent

# Alfresco ELK Server endpoint
export alfrescoELKServer=melmac.zylk.net

# Alfresco logs directory
export tomcatLogs=/opt/alfresco520/tomcat/logs

if [ -z "$logstashAgentDir" ]; then
  echo "Please set logstashAgentDir variable to the path of your logstash-agent folder"
  echo "i.e. export logstashAgentDir=<path>/logstash-agent"
  exit
fi

if [ "$1" = "start" ] ; then
  echo "Starting logstash"
  #Start processes in the background
  nohup ${logstashAgentDir}/bin/logstash -f ${logstashAgentDir}/logstash.conf > /dev/null 2>&1 &
elif [ "$1" = "stop" ] ; then
  echo "Stopping logstash"
  #Terminate previous processes
  ps -ef | grep "${logstashAgentDir}/lib/bootstrap/environment.rb" | grep -v grep | awk '{print $2}' | xargs -I {} kill -9 {}
else
  echo "Use run_logstash.sh <start|stop>"
fi
