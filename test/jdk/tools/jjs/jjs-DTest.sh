#!/bin/sh

#
# Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#


# @test
# @bug 8145750
# @summary jjs fails to run simple scripts with security manager turned on
# @run shell jjs-DTest.sh
# Tests passing of Java system property by -D option

. ${TESTSRC-.}/common.sh

setup

# test whether value specified by -D option is passed
# to script as java.lang.System property.

${JJS} -J-Djava.security.manager -J-Djava.security.policy=${TESTSRC}/sysprops.policy -Djjs.foo=bar ${TESTSRC}/sysprops.js

if [ $? -ne 0 ]; then 
    exit 1
fi
