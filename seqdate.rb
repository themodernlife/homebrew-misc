require 'formula'

class Seqdate < Formula
  head 'https://github.com/themodernlife/seqdate'
  
  def seqdate_script
    <<-EOS.undent
      #!/bin/bash
      exec #{libexec}/bin/seqdate "$@"
    EOS
  end

  def install
    system "sbt", "universal:package-bin"
    system 'unzip', Dir['target/universal/seqdate-0.1.zip'], "-d", "target/universal/unzipped"
    libexec.install Dir['target/universal/unzipped/seqdate-0.1/*']
    (bin/"seqdate").write seqdate_script
  end
end
