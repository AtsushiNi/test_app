# log functions

AWSのFaaSで構築  

- API Gateway -> Lambda -> DynamoDB  

API関数毎にディレクトリを作成  

ローカルでの開発はAWS SAM CLI (AWS SAM LOCAL)を
https://aws.amazon.com/jp/blogs/news/aws-server

デプロイはmaster/developへのpushでCodePipeline 

- CloudFormationでAPI GatewayとLambdaとDynamoDB

## 参考

AWS Serverless Application Repository  
https://serverlessrepo.aws.amazon.com/applicati

api-lambda-save-dynamodb  
https://serverlessrepo.aws.amazon.com/applicati

api-lambda-update-dynamodb  
https://serverlessrepo.aws.amazon.com/applicati

api-lambda-delete-dynamodb  
https://serverlessrepo.aws.amazon.com/applicati

api-lambda-get-all-dynamodb  
https://serverlessrepo.aws.amazon.com/applicati

api-lambda-get-one-dynamodb  
https://serverlessrepo.aws.amazon.com/applicati

## 環境構築

### aws-sam-cliのインストール

  ```sh
  brew tap aws/tap
  brew install aws-sam-cli
  ```

### aws-cliのインストール

  ```sh
  pip install awscli
  ```

### aws-cliの設定

  ```sh
  aws configure
  ```
  Access Key等はsalesの.env参照  
  region: ap-northeast-1  
  output: json

### docker networkの設定

  ```sh
  docker network create lambda-local
  ```

### action_logsテーブルの作成

  ```sh
  docker-compose up
  ```

  ```sh
  aws dynamodb create-table --endpoint-url http
  ```

## 実行手順

  ```sh
  docker-compose up
  ```

  ```sh
  npm run watch
  ```

  ```sh
  npm run start
  ```

  localhost:3003にsamが立ち上がります.


## データベースへの接続
localhost:8001


## テーブルの命名規則
Env = development or staging or production

### テーブル名
{ENV}_TableName  

例: action_logsテーブル  
development: development_action_logs  
staging: staging_action_logs  
production: production_action_logs  


### インデックス名
{ENV}_IndexName

例: EnterpriseAccountUuidインデックス
development: development_EnterpriseAccountUuid 
staging: staging_EnterpriseAccountUuid  
production: production_EnterpriseAccountUuid  
