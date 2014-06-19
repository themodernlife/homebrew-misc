require 'formula'

class Scalariform < Formula
  url 'https://github.com/mdr/scalariform', :using => :nounzip
  homepage 'https://github.com/mdr/scalariform'

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
