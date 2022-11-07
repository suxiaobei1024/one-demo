#!/bin/bash
PACKAGE_NAME="one-demo"
VRESION="1.3.1"
PREFIX_DIR="/opt/$PACKAGE_NAME"
SOURCE_DIR="one_demo"
OUTPUT="output"

step3_build_rpm() {
    fpm -s dir -t rpm \
    	-n $PACKAGE_NAME \
    	-v $VRESION \
    	--iteration 1 \
    	-C $SOURCE_DIR\
    	-f -p $OUTPUT \
    	--prefix $PREFIX_DIR \
    	--post-install scripts/post_install.sh \
    	--pre-install scripts/pre_install.sh \
    	--post-uninstall scripts/post_uninstall.sh \
    	--pre-uninstall scripts/pre_uninstall.sh
}

build_rpm() {
    #step1_pull_code
    #step2_define_config
    step3_build_rpm
}

build_rpm
