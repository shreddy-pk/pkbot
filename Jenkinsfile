node {
stage ('Deploy') {
   sh 'ssh -p2244 pkbot@pkbotnode git clone -b master https://github.com/vishnu4b3/pkbot.git'
  sleep 30
   sh 'ssh -p2244 pkbot@pkbotnode cd /home/pkbot/pkbot && sudo docker build -t hubotimage . && sudo docker volume create hubotvolume'
   sh 'ssh -p2244 pkbot@pkbotnode sudo docker run -itd -p 6379 --name hubot -v hubotvolume:/home/hubot/pkbot hubotimage'
		    }
}
