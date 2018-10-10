FROM ubuntu:latest
RUN sudo apt-get update && sudo apt-get install git \ &&
    cd /home/ubuntu && git clone https://github.com/minepicco/menlo-monitor.git \ &&
    sudo chmod -R +x menlo-test 
CMD "/home/ubuntu/menlo-test/menlomonitor.sh &"
