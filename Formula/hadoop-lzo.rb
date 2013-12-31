require 'formula'

class HadoopLzo < Formula
  homepage 'http://box-project.org/'
  url 'https://github.com/twitter/hadoop-lzo/tarball/release-0.4.19'
  sha1 'd18596280a5b0fcd103b5ad4552b5ffc97816d61'

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