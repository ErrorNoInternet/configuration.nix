{inputs'}:
inputs'.attic.packages.attic.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [
      ./https-api-endpoint.patch
      ./optimized-build.patch
    ];
})
