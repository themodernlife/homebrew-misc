require 'formula'

class Scalariform < Formula
  homepage 'https://github.com/mdr/scalariform'

  resource 'jar' do
    url 'https://s3.amazonaws.com/scalariform/scalariform.jar'
  end

  def install
    libexec.install resource('jar')
    (bin/"scalariform").write scalariform_script
  end

  def scalariform_script
    <<-EOS.undent
      #!/bin/bash
      java -jar  #{libexec}/scalariform.jar "$@"
    EOS
  end
end
