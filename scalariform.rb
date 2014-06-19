require 'formula'

class Scalariform < Formula
  url 'https://s3.amazonaws.com/scalariform/scalariform.jar', :using => :nounzip
  homepage 'https://github.com/mdr/scalariform'
  sha1 '7a145260dcdc3a7b5fcf7df40f92f781ccc75d85'
  version '0.1.4'

  def install
    libexec.install 'scalariform.jar'
    (bin/"scalariform").write scalariform_script
  end

  def scalariform_script
    <<-EOS.undent
      #!/bin/bash
      java -jar  #{libexec}/scalariform.jar "$@"
    EOS
  end
end
