require 'formula'

class HadoopSnappy < Formula
  homepage 'https://github.com/xerial/snappy-java'

  url 'https://github.com/xerial/snappy-java/archive/1.1.1.3.tar.gz'
  sha1 '16670cc681edbea95c642b39787ab0caddded616'

  depends_on "sbt"

  def install
    ENV.fetch('JAVA_HOME') do
      odie "JAVA_HOME is not set. Enure you've installed JDK 1.7 and then add export JAVA_HOME=`/usr/libexec/java_home` to your .bashrc"
    end

    system "make", "native", "LIBNAME=libsnappyjava.dylib"
    system "./sbt", "package"
    
    libexec.install Dir['target/*']
  end

  # def native_lib
  #   `find #{libexec} -iname 'lib' -type d -print -quit`
  # end

  def caveats; <<-EOS.undent
    Make sure you add the following lines to your .bashrc:

    export HADOOP_CLASSPATH=#{opt_prefix}/libexec/snappy-java-1.1.1.3.jar:$HADOOP_CLASSPATH

    EOS
  end


end
