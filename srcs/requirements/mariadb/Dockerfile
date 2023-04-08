# 베이스 이미지 설정
FROM alpine:3.13.5

# Mariadb 설치
RUN apk update && apk add --no-cache mariadb mariadb-client

# 데이터베이스 디렉토리 생성
RUN mkdir -p /home/sielee/data

# 마운트 가능한 볼륨 생성
VOLUME /home/sielee/data

# 포트 매핑
EXPOSE 3306

# 컨테이너 실행 시 자동으로 실행할 명령어
CMD ["mysqld"]

