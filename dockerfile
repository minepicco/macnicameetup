from ubuntu:latest

RUN sudo apt-get update && sudo apt-get install git \ &&
    cd /hhome/ubuntu && git clone https://github.com/minepicco/menlo-monitor.git \ &&
    chmod -R +x menlo-test
CMD "/home/ubuntu/menlo-test/menlomonitor.sh &"
