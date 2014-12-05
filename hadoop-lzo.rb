require 'formula'

class HadoopLzo < Formula
  homepage 'https://github.com/twitter/hadoop-lzo'
  url 'https://github.com/twitter/hadoop-lzo/archive/release-0.4.19.tar.gz'
  sha1 'ec2f6ed9114301b46e5a1977f74ef9047f38c3e5'

  depends_on "maven"
  depends_on "lzop"

  def install
		ENV.fetch('JAVA_HOME') do
			odie "JAVA_HOME is not set. Enure you've installed JDK 1.7 and then add export JAVA_HOME=`/usr/libexec/java_home` to your .bashrc"
    end

    system "mvn", "package"
		libexec.install Dir['target/*']
  end

	def native_lib
		`find #{libexec} -iname 'lib' -type d -print -quit`
	end

	def caveats; <<-EOS.undent
    Make sure you add the following lines to your .bashrc:

      export HADOOP_CLASSPATH=#{opt_prefix}/libexec/hadoop-lzo-#{version}.jar:$HADOOP_CLASSPATH
      export JAVA_LIBRARY_PATH=#{native_lib}

    Also make sure the below line is commented out in /usr/local/Cellar/hadoop/1.2.1/libexec/bin/hadoop

      # JAVA_LIBRARY_PATH=''

    Then make sure you update your mapred-site.xml

      <!-- Transparent LZO compression + decompression (ensure you have the native libs installed) -->
      <property>
        <name>io.compression.codecs</name>
        <value>org.apache.hadoop.io.compress.GzipCodec,org.apache.hadoop.io.compress.DefaultCodec,com.hadoop.compression.lzo.LzoCodec,com.hadoop.compression.lzo.LzopCodec,org.apache.hadoop.io.compress.BZip2Codec</value>
      </property>
      <property>
        <name>io.compression.codec.lzo.class</name>
        <value>com.hadoop.compression.lzo.LzoCodec</value>
      </property>

    EOS
  end


end
