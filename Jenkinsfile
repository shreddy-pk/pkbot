node {
  
    // Variable declaration:
  hostname  = "pkbot@pkbotnode"
  hubot_image_name  = "stagehubot"
  hubot_container_name  = "hubot"
	pkbot_home      = "/home/pkbot/pkbot"
  pkbot_docker_connect      = "tcp://192.168.10.235:2376"
  
  stage ('Checkout code') {
   def tokenid = getGitLabToken();
   echo $tokenid
   sh "ssh -p2244 $hostname rm  -rf $pkbot_home"
   sh "ssh -p2244 $hostname git clone -b master https://github.com/vishnu4b3/pkbot.git"
   sleep 5
  }
  stage ('Build Docker Image') {
   sh "ssh -p2244 $hostname  docker -H  $pkbot_docker_connect build -t $hubot_image_name $pkbot_home/"
   sleep 5 
  }
  stage ('Build Docker Container') {
   sh "ssh -p2244 $hostname  chmod +x $pkbot_home/remove-container.sh" 
   sh "ssh -p2244 $hostname  $pkbot_home/remove-container.sh"
   sh "ssh -p2244 $hostname  docker -H  $pkbot_docker_connect run -d -p 6379 --name $hubot_container_name -e HUBOT_SLACK_TOKEN=$Slack_Key $hubot_image_name"
   
	}
}


def getGitLabToken() {

  def jenkins_creds = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0]

  String token = jenkins_creds.getStore().getDomains().findResult { domain ->
    jenkins_creds.getCredentials(domain).findResult { credential ->
      if (hubot--slack.equals(credential.id)) {
        credential.getApiToken()
      }
    }
  }
}
