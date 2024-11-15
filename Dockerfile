# 기본 이미지 사용
FROM ghcr.io/sslab-gatech/robofuzz:latest

# 작업 디렉토리 설정
WORKDIR /robofuzz/src

RUN cd /robofuzz/src


RUN git config --global user.name "DevMinGeonPark"
RUN git config --global user.email "devmin7985@gmail.com"
RUN git config --global init.defaultBranch main

# Git 저장소 초기화 및 리모트 추가
RUN git init && \
    git remote add origin https://github.com/DevMinGeonPark/RoIFuzz.git

# 저장소에서 코드 pull

# 강제 Pull 설정

RUN git fetch --all && git reset --hard origin/main

RUN git pull --force origin main

# 작업 디렉토리를 다시 /app으로 설정
WORKDIR /robofuzz


# 실행 명령어 추가
# bash 별칭 추가
WORKDIR /robofuzz/src

RUN echo "alias idlfuzz='./fuzzer.py --test-rosidl --no-cov --watchlist watchlist/idltest.json'" >> ~/.bashrc

# .bashrc 파일을 소스로 지정하여 별칭을 즉시 사용 가능하게 함
RUN echo "source ~/.bashrc" >> ~/.bash_profile
