require 'formula'

class SeqDate < Formula
  head 'https://github.com/themodernlife/seqdate.git'

  def install
    system "sbt", "universal:package-bin"
    system 'unzip', Dir['target/universal/*.zip'], "-d", "target/universal/unzipped"
    prefix.install Dir['target/universal/unzipped/*']
  end
end
