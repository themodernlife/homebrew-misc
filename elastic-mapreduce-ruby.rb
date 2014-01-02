require 'formula'

class ElasticMapreduceRuby < Formula
  homepage 'https://github.com/tc/elastic-mapreduce-ruby'
  url 'https://github.com/tc/elastic-mapreduce-ruby/archive/master.tar.gz'
  sha1 '69b2039ba72a9caf0a120f4d5b4e16bd6ecd54c1'

  def elastic_mapreduce_script
    <<-EOS.undent
      #!/bin/bash
      exec #{libexec}/elastic-mapreduce "$@"
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin/"elastic-mapreduce").write elastic_mapreduce_script
  end
end
