class LibgpgError < Formula
  desc "Common error values for all GnuPG components"
  homepage "https://www.gnupg.org/related_software/libgpg-error/"
  url "https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.29.tar.bz2"
  mirror "https://mirrors.ocf.berkeley.edu/debian/pool/main/libg/libgpg-error/libgpg-error_1.29.orig.tar.bz2"
  sha256 "ece926fa5719d17a7ad8da618712cfa2f8a796ab2f2af9d544c5bb093383b1ea"

  bottle do
    sha256 "759835f6fc52907db4219d3587ea91a85b87c002d5009de8eecf848016a80250" => :high_sierra
    sha256 "6cf81e0e40734a71ae8e690a8b94196b6f0360df75b1cbf32296582f6e5a2680" => :sierra
    sha256 "8b5f1e6b20f10d5419e27a987f42089dcc26b0b4fe03120747ca034c5ddf91d2" => :el_capitan
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-static"
    system "make", "install"

    # avoid triggering mandatory rebuilds of software that hard-codes this path
    inreplace bin/"gpg-error-config", prefix, opt_prefix
  end

  test do
    system "#{bin}/gpg-error-config", "--libs"
  end
end
