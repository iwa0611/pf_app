FROM ruby:2.7.3-buster

#パッケージインストール
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

#作業ディレクトリの作成
RUN mkdir /pf_app

#作業ディレクトリをAPP_ROOTに割り当てる
ENV APP_ROOT /pf_app
WORKDIR $APP_ROOT

#ローカルのGemfikeを追加
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

#Gemfileのbundle installを実行
RUN bundle install
ADD . $APP_ROOT
