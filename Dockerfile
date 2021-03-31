FROM movecrew/core-i9:alpine-latest

RUN mkdir /Core-i9 && chmod 777 /Core-i9
ENV PATH="/Core-i9/bin:$PATH"
WORKDIR /Core-i9

RUN git clone https://github.com/Razer-Cynosa/Core-i9 -b sql-extended /Core-i9

#
# Copies session and config(if it exists)
#
COPY ./sample_config.env ./userbot.session* ./config.env* /Core-i9/

#
# Make open port TCP
#
EXPOSE 80 443

#
# Finalization
#
CMD ["python3","-m","userbot"]
