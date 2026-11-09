# iOS 构建工具链：gem 版本全部写死（不用 ~> / >=），改动需人工确认
# Ruby 用 ~/development/portable-ruby/3.4.5，不碰系统自带 2.6.10
# 复现：PATH="$HOME/development/portable-ruby/3.4.5/bin:$PATH" bundle install

source "https://rubygems.org"

ruby "3.4.5"

gem "cocoapods", "1.16.2"
gem "cocoapods-core", "1.16.2"
gem "xcodeproj", "1.28.1"

# 后续 CLI 工具依赖在此追加，同样写精确版本
