node {
  
    // Variable declaration:
  hostname  = "pkbot@pkbotnode"
  hubot_image_name  = "stagehubot"
  hubot_container_name  = "hubot"
	pkbot_home      = "/home/pkbot"
  pkbot_docker_connect      = "tcp://192.168.10.235:2376"
  
  stage ('Code cloning') {
   sh 'ssh -p2244 pkbot@pkbotnode rm  -rf $pkbot_home/pkbot'
   sh 'ssh -p2244 pkbot@pkbotnode git clone -b master https://github.com/vishnu4b3/pkbot.git'
   sleep 5
  }
  stage ('Build Docker Image') {
   sh 'ssh -p2244 pkbot@pkbotnode  docker -H  $pkbot_docker_connect build -t $hubot_image_name $pkbot_home/pkbot/'
   sleep 5 
  }
  stage ('Build Docker Container') {
   sh 'ssh -p2244 pkbot@pkbotnode  chmod +x $pkbot_home/pkbot/remove-container.sh' 
   sh 'ssh -p2244 pkbot@pkbotnode  $pkbot_home/remove-container.sh'
   sh 'ssh -p2244 pkbot@pkbotnode  docker -H  $pkbot_docker_connect run -d -p 6379 --name $hubot_container_name stagehubot'
   
	}
}
