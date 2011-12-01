#! /bin/sh

# matplotlib-0.99.1.2.tar.gz has a "matplotlib-0.99.1.1" inner directory
# (note the mismatching versions); reflect this in the regenerated tarball:
version=$1
innerversion=$2

[ -z $version ] && exit 1

dir=matplotlib-${innerversion}
file=matplotlib-${version}.tar.gz
result=matplotlib-${version}-without-gpc.tar.gz

rm -rf matplotlib-${innerversion}
tar xzf $file

rm matplotlib-${innerversion}/agg24/include/agg_conv_gpc.h

rm -f $result
tar czf $result $dir
