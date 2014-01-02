require 'formula'

class ElasticMapreduceRuby < Formula
  head 'https://github.com/tc/elastic-mapreduce-ruby.git', :revision => 'a0842130086fcc618c83b86a40ca050d0bf66a98'
  
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
