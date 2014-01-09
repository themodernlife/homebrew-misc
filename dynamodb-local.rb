require 'formula'

class DynamodbLocal < Formula
  homepage 'http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html'
  url 'https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_2013-12-12.tar.gz'
  sha1 '66e39e57297a394e7ca7b30d3072c615fd413310'
  
  def dynamodb_script
    <<-EOS.undent
      #!/bin/bash
      exec java -Djava.library.path=#{libexec}/DynamoDBLocal_lib -jar #{libexec}/DynamoDBLocal.jar "$@"
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin/"dynamodb").write dynamodb_script
  end
end
