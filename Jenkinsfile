node {
  stage ('Code cloning') {
   sh 'ssh -p2244 pkbot@pkbotnode rm -rf /home/pkbot/pkbot'
   sh 'ssh -p2244 pkbot@pkbotnode git clone -b master https://github.com/vishnu4b3/pkbot.git'
   sleep 5
  }
  stage ('Create Docker Image') {
   sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 build -t stagehubot /home/pkbot/pkbot/'
   sleep 5 
  }
  stage ('Create Docker Container') {
   sh 'ssh -p2244 pkbot@pkbotnode chmod +x /home/pkbot/pkbot/remove-container.sh' 
   sh 'ssh -p2244 pkbot@pkbotnode /home/pkbot/pkbot/remove-container.sh'
   sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 run -d -p 6379 --name hubot stagehubot'
	}
}
