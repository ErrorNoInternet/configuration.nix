{ pkgs, ... }:
{
  files = {
    ".gnupg/gpg.conf".text = ''
      cert-digest-algo SHA512
      charset utf-8
      default-key 2486BFB7B1E6A4A3
      default-preference-list SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed
      fixed-list-mode
      keyid-format 0xlong
      keyserver hkps://keyserver.ubuntu.com
      list-options show-uid-validity
      no-comments
      no-emit-version
      no-symkey-cache
      personal-cipher-preferences AES256 AES192 AES
      personal-compress-preferences ZLIB BZIP2 ZIP Uncompressed
      personal-digest-preferences SHA512 SHA384 SHA256
      require-cross-certification
      s2k-cipher-algo AES256
      s2k-digest-algo SHA512
      use-agent
      verify-options show-uid-validity
      with-fingerprint
    '';

    ".gnupg/gpg-agent.conf".text = ''
      grab
      default-cache-ttl 86400
      max-cache-ttl 86400
      pinentry-program ${pkgs.pinentry-curses}/bin/pinentry-curses
    '';
  };
}
