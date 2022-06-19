# FROM python:3.10-alpine
# # FROM alpine:3.16

# EXPOSE 80

# RUN apk add --update coreutils && rm -rf /var/cache/apk/*

# RUN pip install fastapi

# RUN pip install uvicorn

# WORKDIR /usr/src/app

# COPY . .

# # uvicorn application:app --port 7777 --reload
# CMD [ "uvicorn", "application:app", "--port", "7777", "--reload" ]
# # CMD ["sh", "hasher.sh"]

# 
FROM python:3.9

# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./app /code/app
COPY ./code /code

# WORKDIR /code/app
# 
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
CMD [ "sh", "start.sh"]
# CMD [ "ls", "-al"]
# EXPOSE 80
# CMD ["uvicorn", "app.main:app", "--port", "80"]
