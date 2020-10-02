#!/bin/sh -e

delim() { echo $1 | perl -lne 's/(..)/$1:/g;chop;print'; }
runtest() {
	cat <<EOF
--------------------------------------------------------------------------------
$@
EOF
	$@
}
# LEAP
test_asleap() {
	runtest asleap -C $1 -R $2 -Wpwds.txt $5
	runtest asleap -C $1 -R $2 -G9 -g$4 $5
	runtest asleap -C $(delim $1) -R $2 -Wpwds.txt $5
	runtest asleap -C $(delim $1) -R $2 -G9 -g$4 $5
	runtest asleap -C $1 -R $(delim $2) -Wpwds.txt $5
	runtest asleap -C $1 -R $(delim $2) -G9 -g$4 $5
	runtest asleap -C $(delim $1) -R $(delim $2) -Wpwds.txt $5
	runtest asleap -C $(delim $1) -R $(delim $2) -G9 -g$4 $5
	runtest asleap -s -r $3 -Wpwds.txt $5
	runtest asleap -s -r $3 -G9 -g$4 $5
}

test_asleap \
	e3a5d0775370bda51e16219a06b0278f \
	84c4b33e00d9231645598acf91c384800000000000000000565fe2492fd5fb88edaec934c00d282c046227406c31609b00 \
	pptp.dump \
	turqoise \
	-Uscott

test_asleap \
	ceb69885c656590c \
	7279f65aa49870f45822c89dcbdd73c1b89d377844caead4 \
	joshlea.dump \
	pasword

test_asleap \
	41e55900c12f88ad \
	278344f7083df3b62392d76644c47effb409f4338a100be6 \
	joshlea.dump \
	pasword

test_asleap \
	afe811f2ae948bdb \
	5b79dab8bf72ed434ebca8a784466bffb28f6e94280c918d \
	leap2.dump \
	blamo

test_asleap \
	0786aea0215bc30a \
	7f6a14f11eeb980fda11bf83a142a8744f00683ad5bc5cb6 \
	leap.dump \
	qalep

test_asleap \
	5685b11cadcf1f36 \
	bc527447e3d25ab8f33b7bc5ad98e75b51855ee7b994e2a4 \
	leap.dump \
	Ciso123

cat <<EOF
!!! ALL TEST PASSED SUCCESSFULLY !!!
EOF

