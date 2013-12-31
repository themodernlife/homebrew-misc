require 'formula'

class HadoopLzo < Formula
  homepage 'https://github.com/twitter/hadoop-lzo'
  url 'https://github.com/twitter/hadoop-lzo/archive/release-0.4.19.tar.gz'
  sha1 'fe3ee09a0d43a4c343f6ee05659b4cf53cf82cad'

  depends_on maven
  depends_on lzop

  def install
		system 'mvn test package'
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "box --version".

    You can read more about box by running:
      "brew home box".
    EOS
  end

end