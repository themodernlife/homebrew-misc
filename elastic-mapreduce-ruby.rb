require 'formula'

class Elastic < Formula
  homepage 'http://aws.amazon.com/developertools/2264'
  url 'http://elasticmapreduce.s3.amazonaws.com/elastic-mapreduce-ruby.zip'
  sha1 '200b48171890ebc374ad2f6caf51455504800a55'

  def install
    libexec.install Dir['*']
  end
end
