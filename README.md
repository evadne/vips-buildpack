# VIPS Buildpack

Grabs the latest Anvil artifact (see `build.sh`) for VIPS 7.40

## Environment

If you’re using heroku-buildpack-multi, you will have to manually make the following changes:

    export PATH=$HOME/vendor/vips/bin:$PATH
    export PKG_CONFIG_PATH=$HOME/vendor/vips/lib/pkgconfig:$PKG_CONFIG_PATH
    export LD_LIBRARY_PATH=$HOME/vendor/vips/lib:$LD_LIBRARY_PATH

## Verification

    $ git clone $BUILDPACK_URL vips-buildpack
    $ cd vips-buildpack
    $ heroku apps:create --buildpack $BUILDPACK_URL
    $ git push heroku master
    $ heroku run bash
    …
    $ vips 
