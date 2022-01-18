FROM ruby:2.7.3-buster

#パッケージインストール
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    default-mysql-client

#node.jsインストール
RUN apt-get install -y nodejs npm && npm install n -g && n 12.13.0

#yarnインストール
RUN wget https://github.com/yarnpkg/yarn/releases/download/v1.22.10/yarn_1.22.10_all.deb \
    && dpkg -i yarn_1.22.10_all.deb

#作業ディレクトリの作成
RUN mkdir /pf_app

#作業ディレクトリをAPP_ROOTに割り当てる
ENV APP_ROOT /pf_app
WORKDIR $APP_ROOT

#ローカルのGemfikeを追加
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

#nokogiri関係でエラーが発生するので追加
RUN bundle config set force_ruby_platform true

#Gemfileのbundle installを実行
RUN bundle install
ADD . $APP_ROOT
