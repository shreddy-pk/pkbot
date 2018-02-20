node {
stage ('Code cloning') {
   sh 'ssh -p2244 pkbot@pkbotnode rm -rf /home/pkbot/pkbot'
   sh 'ssh -p2244 pkbot@pkbotnode git clone -b master https://github.com/vishnu4b3/pkbot.git'
  sleep 30
   sh 'ssh -p2244 pkbot@pkbotnode cd /home/pkbot/pkbot'
  sleep 10
}
  stage ('Create Docker Image') {
   sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 build -t hubotimage /home/pkbot/pkbot/'
 sleep 30 
  }
  stage ('Create Docker Volume') {
  
   sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 volume create hubotvolume'
  sleep 10
  }
  stage ('Create Docker Container') {
   //sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 stop hubot'
   //sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 rm hubot'
   sh 'ssh -p2244 pkbot@pkbotnode chmod +x /home/pkbot/pkbot/remove-container.sh' 
   sh 'ssh -p2244 pkbot@pkbotnode /home/pkbot/pkbot/remove-container.sh'
   // sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 rm $(docker ps -aq --filter name=hubot)'
   sh 'ssh -p2244 pkbot@pkbotnode docker -H  tcp://192.168.10.235:2376 run -d -p 6379 --name hubot hubotimage'
		    }
}
