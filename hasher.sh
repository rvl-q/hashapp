#!/bin/bash
RND=`dd count=1 if=/dev/urandom 2>/dev/null | md5sum -b|cut -c1-32`
echo $RND
