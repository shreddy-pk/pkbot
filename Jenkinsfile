stage ('Deploy') {

         sh 'ssh -p2244 pkbot@pkbotnode '"cd / && git clone -b dev https://github.com/tsrimahesh/pkbot.git'
         sh 'ssh -p2244 pkbot@pkbotnode '"cd /pkbot && sudo docker build -t hubotimage . && sudo docker volume create hubotvolume"'
         sh 'ssh -p2244 pkbot@pkbotnode '"sudo docker run -itd -p 6379 --name hubot -v hubotvolume:/home/hubot/pkbot hubotimage"'
		    }
