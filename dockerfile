# base image 
FROM bash:4.4

# ENV 
ENV TYPE="json"
ENV MESSAGE="I-am-bash-parser-json-to-logstash"
ENV IP="192.162.1.12"
ENV PORT="50001"
ENV RUN_TIME="300" 

# Working DIR 
WORKDIR /

#Copy script to image
COPY json-bash.sh .

# Run the script 
CMD ["bash", "/json-bash.sh"]
