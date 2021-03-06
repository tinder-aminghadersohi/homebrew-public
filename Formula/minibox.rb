# GENERATED FROM TEMPLATE. DO NOT EDIT!
class  Minibox < Formula
  desc "Minibox CLI"
  homepage "https://github.com/dollarshaveclub/minibox"
  url "git@github.com:dollarshaveclub/minibox.git",
      :using => :git,
      :tag => "v0.5.1",
      :revision => "9f380f9f56041192e99b23b9df5e46faf39cb795"
  revision 1
  head "git@github.com:dollarshaveclub/minibox.git", :using => :git
  depends_on "go" => :build
  depends_on "kubectl"

  
  bottle do
    root_url "https://github.com/dollarshaveclub/minibox/releases/download/v0.5.1/"
    rebuild 1
    sha256 "15a90c3ceaeb1288fbc74b1932b40706944d532e912610b63154e2c4cb62cf2a" => :el_capitan
    sha256 "15a90c3ceaeb1288fbc74b1932b40706944d532e912610b63154e2c4cb62cf2a" => :high_sierra
    sha256 "15a90c3ceaeb1288fbc74b1932b40706944d532e912610b63154e2c4cb62cf2a" => :sierra
  end
  

  def install

    ENV["GOPATH"] = buildpath
    miniboxpath = buildpath/"src/github.com/dollarshaveclub/minibox"
    miniboxpath.install buildpath.children

    cd miniboxpath do
      system "make"
      bin.install "bin/minibox"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/minibox"
    assert true
  end
end
