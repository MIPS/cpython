# N.B. You MUST use -j on FreeBSD.
# This makefile has been automatically generated from the OpenSSL distribution.
# This single makefile will build the complete OpenSSL distribution and
# by default leave the 'interesting' output files in .\out and the stuff
# that needs deleting in .\tmp.
# The file was generated by running 'make makefile.one', which
# does a 'make files', which writes all the environment variables from all
# the makefiles to the file call MINFO.  This file is used by
# util\mk1mf.pl to generate makefile.one.
# The 'makefile per directory' system suites me when developing this
# library and also so I can 'distribute' indervidual library sections.
# The one monster makefile better suits building in non-unix
# environments.

INSTALLTOP=\usr\local\ssl
OPENSSLDIR=\usr\local\ssl

# Set your compiler options
PLATFORM=VC-WIN64A
CC=cl
CFLAG= /MT /Ox -DOPENSSL_THREADS  -DDSO_WIN32 -W3 -Gs0 -Gy -nologo -DOPENSSL_SYSNAME_WIN32 -DWIN32_LEAN_AND_MEAN -DL_ENDIAN -DUNICODE -D_UNICODE -D_CRT_SECURE_NO_DEPRECATE -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DRC4_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DOPENSSL_NO_IDEA -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_MDC2 -DOPENSSL_NO_SSL2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_WEAK_SSL_CIPHERS -DOPENSSL_NO_DYNAMIC_ENGINE    
APP_CFLAG= /Zi /Fd$(TMP_D)/app
LIB_CFLAG=/Zl /Zi /Fd$(TMP_D)/lib
SHLIB_CFLAG=
APP_EX_OBJ=setargv.obj
SHLIB_EX_OBJ=
# add extra libraries to this define, for solaris -lsocket -lnsl would
# be added
EX_LIBS=ws2_32.lib gdi32.lib advapi32.lib crypt32.lib user32.lib

# The OpenSSL directory
SRC_D=.

LINK_CMD=link
LFLAGS=/nologo /subsystem:console /opt:ref /debug
RSC=rc

# The output directory for everything interesting
OUT_D=out32
# The output directory for all the temporary muck
TMP_D=tmp32
# The output directory for the header files
INC_D=inc32
INCO_D=inc32\openssl

PERL=perl
CP=$(PERL) util/copy.pl
RM=del /Q
RANLIB=
MKDIR=$(PERL) util/mkdir-p.pl
MKLIB=lib /nologo
MLFLAGS=
ASM=nasm -f win64 -DNEAR -Ox -g

# FIPS validated module and support file locations

E_PREMAIN_DSO=fips_premain_dso

FIPSDIR=\usr\local\ssl\fips-2.0
BASEADDR=0xFB00000
FIPSLIB_D=$(FIPSDIR)\lib
FIPS_PREMAIN_SRC=$(FIPSLIB_D)\fips_premain.c
O_FIPSCANISTER=$(FIPSLIB_D)\fipscanister.lib
FIPS_SHA1_EXE=$(FIPSDIR)\bin\fips_standalone_sha1.exe
PREMAIN_DSO_EXE=$(BIN_D)\fips_premain_dso.exe
FIPSLINK=$(PERL) $(FIPSDIR)\bin\fipslink.pl

######################################################
# You should not need to touch anything below this point
######################################################

E_EXE=openssl
SSL=ssleay32
CRYPTO=libeay32

# BIN_D  - Binary output directory
# TEST_D - Binary test file output directory
# LIB_D  - library output directory
# ENG_D  - dynamic engine output directory
# Note: if you change these point to different directories then uncomment out
# the lines around the 'NB' comment below.
# 
BIN_D=$(OUT_D)
TEST_D=$(OUT_D)
LIB_D=$(OUT_D)
ENG_D=$(OUT_D)

# INCL_D - local library directory
# OBJ_D  - temp object file directory
OBJ_D=$(TMP_D)
INCL_D=$(TMP_D)

O_SSL=     $(LIB_D)\$(SSL).lib
O_CRYPTO=  $(LIB_D)\$(CRYPTO).lib
SO_SSL=    $(SSL)
SO_CRYPTO= $(CRYPTO)
L_SSL=     $(LIB_D)\$(SSL).lib
L_CRYPTO=  $(LIB_D)\$(CRYPTO).lib

L_LIBS= $(L_SSL) $(L_CRYPTO) 

######################################################
# Don't touch anything below this point
######################################################

INC=-I$(INC_D) -I$(INCL_D)
APP_CFLAGS=$(INC) $(CFLAG) $(APP_CFLAG)
LIB_CFLAGS=$(INC) $(CFLAG) $(LIB_CFLAG)
SHLIB_CFLAGS=$(INC) $(CFLAG) $(LIB_CFLAG) $(SHLIB_CFLAG)
LIBS_DEP=$(O_CRYPTO) $(O_SSL)

#############################################
HEADER=$(INCL_D)\e_os.h \
	$(INCL_D)\cryptlib.h $(INCL_D)\buildinf.h $(INCL_D)\md32_common.h \
	$(INCL_D)\o_time.h $(INCL_D)\o_str.h $(INCL_D)\o_dir.h \
	$(INCL_D)\constant_time_locl.h $(INCL_D)\md4_locl.h $(INCL_D)\md5_locl.h \
	$(INCL_D)\sha_locl.h $(INCL_D)\rmd_locl.h $(INCL_D)\rmdconst.h \
	$(INCL_D)\des_locl.h $(INCL_D)\rpc_des.h $(INCL_D)\spr.h \
	$(INCL_D)\des_ver.h $(INCL_D)\rc2_locl.h $(INCL_D)\rc4_locl.h \
	$(INCL_D)\bf_pi.h $(INCL_D)\bf_locl.h $(INCL_D)\cast_s.h \
	$(INCL_D)\cast_lcl.h $(INCL_D)\aes_locl.h $(INCL_D)\cmll_locl.h \
	$(INCL_D)\seed_locl.h $(INCL_D)\modes_lcl.h $(INCL_D)\bn_lcl.h \
	$(INCL_D)\bn_prime.h $(INCL_D)\dsa_locl.h $(INCL_D)\ec_lcl.h \
	$(INCL_D)\ech_locl.h $(INCL_D)\ecs_locl.h $(INCL_D)\bio_lcl.h \
	$(INCL_D)\obj_dat.h $(INCL_D)\obj_xref.h $(INCL_D)\evp_locl.h \
	$(INCL_D)\asn1_locl.h $(INCL_D)\vpm_int.h $(INCL_D)\pcy_int.h \
	$(INCL_D)\cms_lcl.h $(INCL_D)\conf_def.h $(INCL_D)\ui_locl.h \
	$(INCL_D)\wp_locl.h $(INCL_D)\ssl_locl.h $(INCL_D)\kssl_lcl.h \
	$(INCL_D)\apps.h $(INCL_D)\progs.h $(INCL_D)\s_apps.h \
	$(INCL_D)\testdsa.h $(INCL_D)\testrsa.h $(INCL_D)\e_4758cca_err.c \
	$(INCL_D)\e_4758cca_err.h $(INCL_D)\e_aep_err.c $(INCL_D)\e_aep_err.h \
	$(INCL_D)\e_atalla_err.c $(INCL_D)\e_atalla_err.h $(INCL_D)\e_cswift_err.c \
	$(INCL_D)\e_cswift_err.h $(INCL_D)\e_gmp_err.c $(INCL_D)\e_gmp_err.h \
	$(INCL_D)\e_chil_err.c $(INCL_D)\e_chil_err.h $(INCL_D)\e_nuron_err.c \
	$(INCL_D)\e_nuron_err.h $(INCL_D)\e_sureware_err.c $(INCL_D)\e_sureware_err.h \
	$(INCL_D)\e_ubsec_err.c $(INCL_D)\e_ubsec_err.h $(INCL_D)\e_capi_err.c \
	$(INCL_D)\e_capi_err.h $(INCL_D)\testutil.h $(INCL_D)\ssltestlib.h 

EXHEADER=$(INCO_D)\e_os2.h \
	$(INCO_D)\crypto.h $(INCO_D)\opensslv.h $(INCO_D)\opensslconf.h \
	$(INCO_D)\ebcdic.h $(INCO_D)\symhacks.h $(INCO_D)\ossl_typ.h \
	$(INCO_D)\md4.h $(INCO_D)\md5.h $(INCO_D)\sha.h \
	$(INCO_D)\hmac.h $(INCO_D)\cmac.h $(INCO_D)\ripemd.h \
	$(INCO_D)\des.h $(INCO_D)\des_old.h $(INCO_D)\rc2.h \
	$(INCO_D)\rc4.h $(INCO_D)\blowfish.h $(INCO_D)\cast.h \
	$(INCO_D)\aes.h $(INCO_D)\camellia.h $(INCO_D)\seed.h \
	$(INCO_D)\modes.h $(INCO_D)\bn.h $(INCO_D)\rsa.h \
	$(INCO_D)\dsa.h $(INCO_D)\dso.h $(INCO_D)\dh.h \
	$(INCO_D)\ec.h $(INCO_D)\ecdh.h $(INCO_D)\ecdsa.h \
	$(INCO_D)\buffer.h $(INCO_D)\bio.h $(INCO_D)\stack.h \
	$(INCO_D)\safestack.h $(INCO_D)\lhash.h $(INCO_D)\rand.h \
	$(INCO_D)\err.h $(INCO_D)\objects.h $(INCO_D)\obj_mac.h \
	$(INCO_D)\evp.h $(INCO_D)\asn1.h $(INCO_D)\asn1_mac.h \
	$(INCO_D)\asn1t.h $(INCO_D)\pem.h $(INCO_D)\pem2.h \
	$(INCO_D)\x509.h $(INCO_D)\x509_vfy.h $(INCO_D)\x509v3.h \
	$(INCO_D)\cms.h $(INCO_D)\conf.h $(INCO_D)\conf_api.h \
	$(INCO_D)\txt_db.h $(INCO_D)\pkcs7.h $(INCO_D)\pkcs12.h \
	$(INCO_D)\comp.h $(INCO_D)\engine.h $(INCO_D)\ocsp.h \
	$(INCO_D)\ui.h $(INCO_D)\ui_compat.h $(INCO_D)\krb5_asn.h \
	$(INCO_D)\pqueue.h $(INCO_D)\whrlpool.h $(INCO_D)\ts.h \
	$(INCO_D)\srp.h $(INCO_D)\ssl.h $(INCO_D)\ssl2.h \
	$(INCO_D)\ssl3.h $(INCO_D)\ssl23.h $(INCO_D)\tls1.h \
	$(INCO_D)\dtls1.h $(INCO_D)\kssl.h $(INCO_D)\srtp.h 

T_OBJ=$(OBJ_D)\constant_time_test.obj \
	$(OBJ_D)\md4test.obj $(OBJ_D)\md5test.obj $(OBJ_D)\shatest.obj \
	$(OBJ_D)\sha1test.obj $(OBJ_D)\sha256t.obj $(OBJ_D)\sha512t.obj \
	$(OBJ_D)\hmactest.obj $(OBJ_D)\rmdtest.obj $(OBJ_D)\destest.obj \
	$(OBJ_D)\rc2test.obj $(OBJ_D)\rc4test.obj $(OBJ_D)\bftest.obj \
	$(OBJ_D)\casttest.obj $(OBJ_D)\bntest.obj $(OBJ_D)\exptest.obj \
	$(OBJ_D)\rsa_test.obj $(OBJ_D)\dsatest.obj $(OBJ_D)\dhtest.obj \
	$(OBJ_D)\ectest.obj $(OBJ_D)\ecdhtest.obj $(OBJ_D)\ecdsatest.obj \
	$(OBJ_D)\randtest.obj $(OBJ_D)\evp_test.obj $(OBJ_D)\evp_extra_test.obj \
	$(OBJ_D)\verify_extra_test.obj $(OBJ_D)\v3nametest.obj $(OBJ_D)\enginetest.obj \
	$(OBJ_D)\wp_test.obj $(OBJ_D)\srptest.obj $(OBJ_D)\ssltest.obj \
	$(OBJ_D)\heartbeat_test.obj $(OBJ_D)\clienthellotest.obj $(OBJ_D)\sslv2conftest.obj \
	$(OBJ_D)\dtlstest.obj $(OBJ_D)\bad_dtls_test.obj $(OBJ_D)\fatalerrtest.obj \
	$(OBJ_D)\igetest.obj $(OBJ_D)\.obj $(OBJ_D)\ssltestlib.obj 

E_OBJ=$(OBJ_D)\verify.obj \
	$(OBJ_D)\asn1pars.obj $(OBJ_D)\req.obj $(OBJ_D)\dgst.obj \
	$(OBJ_D)\dh.obj $(OBJ_D)\dhparam.obj $(OBJ_D)\enc.obj \
	$(OBJ_D)\passwd.obj $(OBJ_D)\gendh.obj $(OBJ_D)\errstr.obj \
	$(OBJ_D)\ca.obj $(OBJ_D)\pkcs7.obj $(OBJ_D)\crl2p7.obj \
	$(OBJ_D)\crl.obj $(OBJ_D)\rsa.obj $(OBJ_D)\rsautl.obj \
	$(OBJ_D)\dsa.obj $(OBJ_D)\dsaparam.obj $(OBJ_D)\ec.obj \
	$(OBJ_D)\ecparam.obj $(OBJ_D)\x509.obj $(OBJ_D)\genrsa.obj \
	$(OBJ_D)\gendsa.obj $(OBJ_D)\genpkey.obj $(OBJ_D)\s_server.obj \
	$(OBJ_D)\s_client.obj $(OBJ_D)\speed.obj $(OBJ_D)\s_time.obj \
	$(OBJ_D)\apps.obj $(OBJ_D)\s_cb.obj $(OBJ_D)\s_socket.obj \
	$(OBJ_D)\app_rand.obj $(OBJ_D)\version.obj $(OBJ_D)\sess_id.obj \
	$(OBJ_D)\ciphers.obj $(OBJ_D)\nseq.obj $(OBJ_D)\pkcs12.obj \
	$(OBJ_D)\pkcs8.obj $(OBJ_D)\pkey.obj $(OBJ_D)\pkeyparam.obj \
	$(OBJ_D)\pkeyutl.obj $(OBJ_D)\spkac.obj $(OBJ_D)\smime.obj \
	$(OBJ_D)\cms.obj $(OBJ_D)\rand.obj $(OBJ_D)\engine.obj \
	$(OBJ_D)\ocsp.obj $(OBJ_D)\prime.obj $(OBJ_D)\ts.obj \
	$(OBJ_D)\srp.obj $(OBJ_D)\openssl.obj 

SSLOBJ=$(OBJ_D)\s2_meth.obj \
	$(OBJ_D)\s2_srvr.obj $(OBJ_D)\s2_clnt.obj $(OBJ_D)\s2_lib.obj \
	$(OBJ_D)\s2_enc.obj $(OBJ_D)\s2_pkt.obj $(OBJ_D)\s3_meth.obj \
	$(OBJ_D)\s3_srvr.obj $(OBJ_D)\s3_clnt.obj $(OBJ_D)\s3_lib.obj \
	$(OBJ_D)\s3_enc.obj $(OBJ_D)\s3_pkt.obj $(OBJ_D)\s3_both.obj \
	$(OBJ_D)\s3_cbc.obj $(OBJ_D)\s23_meth.obj $(OBJ_D)\s23_srvr.obj \
	$(OBJ_D)\s23_clnt.obj $(OBJ_D)\s23_lib.obj $(OBJ_D)\s23_pkt.obj \
	$(OBJ_D)\t1_meth.obj $(OBJ_D)\t1_srvr.obj $(OBJ_D)\t1_clnt.obj \
	$(OBJ_D)\t1_lib.obj $(OBJ_D)\t1_enc.obj $(OBJ_D)\t1_ext.obj \
	$(OBJ_D)\d1_meth.obj $(OBJ_D)\d1_srvr.obj $(OBJ_D)\d1_clnt.obj \
	$(OBJ_D)\d1_lib.obj $(OBJ_D)\d1_pkt.obj $(OBJ_D)\d1_both.obj \
	$(OBJ_D)\d1_srtp.obj $(OBJ_D)\ssl_lib.obj $(OBJ_D)\ssl_err2.obj \
	$(OBJ_D)\ssl_cert.obj $(OBJ_D)\ssl_sess.obj $(OBJ_D)\ssl_ciph.obj \
	$(OBJ_D)\ssl_stat.obj $(OBJ_D)\ssl_rsa.obj $(OBJ_D)\ssl_asn1.obj \
	$(OBJ_D)\ssl_txt.obj $(OBJ_D)\ssl_algs.obj $(OBJ_D)\ssl_conf.obj \
	$(OBJ_D)\bio_ssl.obj $(OBJ_D)\ssl_err.obj $(OBJ_D)\kssl.obj \
	$(OBJ_D)\t1_reneg.obj $(OBJ_D)\tls_srp.obj $(OBJ_D)\t1_trce.obj \
	$(OBJ_D)\ssl_utst.obj 

CRYPTOOBJ=$(OBJ_D)\cryptlib.obj \
	$(OBJ_D)\mem.obj $(OBJ_D)\mem_dbg.obj $(OBJ_D)\cversion.obj \
	$(OBJ_D)\ex_data.obj $(OBJ_D)\cpt_err.obj $(OBJ_D)\ebcdic.obj \
	$(OBJ_D)\uid.obj $(OBJ_D)\o_time.obj $(OBJ_D)\o_str.obj \
	$(OBJ_D)\o_dir.obj $(OBJ_D)\o_fips.obj $(OBJ_D)\o_init.obj \
	$(OBJ_D)\fips_ers.obj $(OBJ_D)\x86_64cpuid.obj $(OBJ_D)\md4_dgst.obj \
	$(OBJ_D)\md4_one.obj $(OBJ_D)\md5_dgst.obj $(OBJ_D)\md5_one.obj \
	$(OBJ_D)\md5-x86_64.obj $(OBJ_D)\sha_dgst.obj $(OBJ_D)\sha1dgst.obj \
	$(OBJ_D)\sha_one.obj $(OBJ_D)\sha1_one.obj $(OBJ_D)\sha256.obj \
	$(OBJ_D)\sha512.obj $(OBJ_D)\sha1-x86_64.obj $(OBJ_D)\sha256-x86_64.obj \
	$(OBJ_D)\sha512-x86_64.obj $(OBJ_D)\sha1-mb-x86_64.obj $(OBJ_D)\sha256-mb-x86_64.obj \
	$(OBJ_D)\hmac.obj $(OBJ_D)\hm_ameth.obj $(OBJ_D)\hm_pmeth.obj \
	$(OBJ_D)\cmac.obj $(OBJ_D)\cm_ameth.obj $(OBJ_D)\cm_pmeth.obj \
	$(OBJ_D)\rmd_dgst.obj $(OBJ_D)\rmd_one.obj $(OBJ_D)\set_key.obj \
	$(OBJ_D)\ecb_enc.obj $(OBJ_D)\cbc_enc.obj $(OBJ_D)\ecb3_enc.obj \
	$(OBJ_D)\cfb64enc.obj $(OBJ_D)\cfb64ede.obj $(OBJ_D)\cfb_enc.obj \
	$(OBJ_D)\ofb64ede.obj $(OBJ_D)\enc_read.obj $(OBJ_D)\enc_writ.obj \
	$(OBJ_D)\ofb64enc.obj $(OBJ_D)\ofb_enc.obj $(OBJ_D)\str2key.obj \
	$(OBJ_D)\pcbc_enc.obj $(OBJ_D)\qud_cksm.obj $(OBJ_D)\rand_key.obj \
	$(OBJ_D)\des_enc.obj $(OBJ_D)\fcrypt_b.obj $(OBJ_D)\fcrypt.obj \
	$(OBJ_D)\xcbc_enc.obj $(OBJ_D)\rpc_enc.obj $(OBJ_D)\cbc_cksm.obj \
	$(OBJ_D)\ede_cbcm_enc.obj $(OBJ_D)\des_old.obj $(OBJ_D)\des_old2.obj \
	$(OBJ_D)\read2pwd.obj $(OBJ_D)\rc2_ecb.obj $(OBJ_D)\rc2_skey.obj \
	$(OBJ_D)\rc2_cbc.obj $(OBJ_D)\rc2cfb64.obj $(OBJ_D)\rc2ofb64.obj \
	$(OBJ_D)\rc4-x86_64.obj $(OBJ_D)\rc4-md5-x86_64.obj $(OBJ_D)\rc4_utl.obj \
	$(OBJ_D)\bf_skey.obj $(OBJ_D)\bf_ecb.obj $(OBJ_D)\bf_enc.obj \
	$(OBJ_D)\bf_cfb64.obj $(OBJ_D)\bf_ofb64.obj $(OBJ_D)\c_skey.obj \
	$(OBJ_D)\c_ecb.obj $(OBJ_D)\c_enc.obj $(OBJ_D)\c_cfb64.obj \
	$(OBJ_D)\c_ofb64.obj $(OBJ_D)\aes_misc.obj $(OBJ_D)\aes_ecb.obj \
	$(OBJ_D)\aes_cfb.obj $(OBJ_D)\aes_ofb.obj $(OBJ_D)\aes_ctr.obj \
	$(OBJ_D)\aes_ige.obj $(OBJ_D)\aes_wrap.obj $(OBJ_D)\aes-x86_64.obj \
	$(OBJ_D)\vpaes-x86_64.obj $(OBJ_D)\bsaes-x86_64.obj $(OBJ_D)\aesni-x86_64.obj \
	$(OBJ_D)\aesni-sha1-x86_64.obj $(OBJ_D)\aesni-sha256-x86_64.obj $(OBJ_D)\aesni-mb-x86_64.obj \
	$(OBJ_D)\cmll_ecb.obj $(OBJ_D)\cmll_ofb.obj $(OBJ_D)\cmll_cfb.obj \
	$(OBJ_D)\cmll_ctr.obj $(OBJ_D)\cmll_utl.obj $(OBJ_D)\cmll-x86_64.obj \
	$(OBJ_D)\cmll_misc.obj $(OBJ_D)\seed.obj $(OBJ_D)\seed_ecb.obj \
	$(OBJ_D)\seed_cbc.obj $(OBJ_D)\seed_cfb.obj $(OBJ_D)\seed_ofb.obj \
	$(OBJ_D)\cbc128.obj $(OBJ_D)\ctr128.obj $(OBJ_D)\cts128.obj \
	$(OBJ_D)\cfb128.obj $(OBJ_D)\ofb128.obj $(OBJ_D)\gcm128.obj \
	$(OBJ_D)\ccm128.obj $(OBJ_D)\xts128.obj $(OBJ_D)\wrap128.obj \
	$(OBJ_D)\ghash-x86_64.obj $(OBJ_D)\aesni-gcm-x86_64.obj $(OBJ_D)\bn_add.obj \
	$(OBJ_D)\bn_div.obj $(OBJ_D)\bn_exp.obj $(OBJ_D)\bn_lib.obj \
	$(OBJ_D)\bn_ctx.obj $(OBJ_D)\bn_mul.obj $(OBJ_D)\bn_mod.obj \
	$(OBJ_D)\bn_print.obj $(OBJ_D)\bn_rand.obj $(OBJ_D)\bn_shift.obj \
	$(OBJ_D)\bn_word.obj $(OBJ_D)\bn_blind.obj $(OBJ_D)\bn_kron.obj \
	$(OBJ_D)\bn_sqrt.obj $(OBJ_D)\bn_gcd.obj $(OBJ_D)\bn_prime.obj \
	$(OBJ_D)\bn_err.obj $(OBJ_D)\bn_sqr.obj $(OBJ_D)\bn_asm.obj \
	$(OBJ_D)\x86_64-mont.obj $(OBJ_D)\x86_64-mont5.obj $(OBJ_D)\x86_64-gf2m.obj \
	$(OBJ_D)\rsaz_exp.obj $(OBJ_D)\rsaz-x86_64.obj $(OBJ_D)\rsaz-avx2.obj \
	$(OBJ_D)\bn_recp.obj $(OBJ_D)\bn_mont.obj $(OBJ_D)\bn_mpi.obj \
	$(OBJ_D)\bn_exp2.obj $(OBJ_D)\bn_gf2m.obj $(OBJ_D)\bn_nist.obj \
	$(OBJ_D)\bn_depr.obj $(OBJ_D)\bn_const.obj $(OBJ_D)\bn_x931p.obj \
	$(OBJ_D)\rsa_eay.obj $(OBJ_D)\rsa_gen.obj $(OBJ_D)\rsa_lib.obj \
	$(OBJ_D)\rsa_sign.obj $(OBJ_D)\rsa_saos.obj $(OBJ_D)\rsa_err.obj \
	$(OBJ_D)\rsa_pk1.obj $(OBJ_D)\rsa_ssl.obj $(OBJ_D)\rsa_none.obj \
	$(OBJ_D)\rsa_oaep.obj $(OBJ_D)\rsa_chk.obj $(OBJ_D)\rsa_null.obj \
	$(OBJ_D)\rsa_pss.obj $(OBJ_D)\rsa_x931.obj $(OBJ_D)\rsa_asn1.obj \
	$(OBJ_D)\rsa_depr.obj $(OBJ_D)\rsa_ameth.obj $(OBJ_D)\rsa_prn.obj \
	$(OBJ_D)\rsa_pmeth.obj $(OBJ_D)\rsa_crpt.obj $(OBJ_D)\dsa_gen.obj \
	$(OBJ_D)\dsa_key.obj $(OBJ_D)\dsa_lib.obj $(OBJ_D)\dsa_asn1.obj \
	$(OBJ_D)\dsa_vrf.obj $(OBJ_D)\dsa_sign.obj $(OBJ_D)\dsa_err.obj \
	$(OBJ_D)\dsa_ossl.obj $(OBJ_D)\dsa_depr.obj $(OBJ_D)\dsa_ameth.obj \
	$(OBJ_D)\dsa_pmeth.obj $(OBJ_D)\dsa_prn.obj $(OBJ_D)\dso_dl.obj \
	$(OBJ_D)\dso_dlfcn.obj $(OBJ_D)\dso_err.obj $(OBJ_D)\dso_lib.obj \
	$(OBJ_D)\dso_null.obj $(OBJ_D)\dso_openssl.obj $(OBJ_D)\dso_win32.obj \
	$(OBJ_D)\dso_vms.obj $(OBJ_D)\dso_beos.obj $(OBJ_D)\dh_asn1.obj \
	$(OBJ_D)\dh_gen.obj $(OBJ_D)\dh_key.obj $(OBJ_D)\dh_lib.obj \
	$(OBJ_D)\dh_check.obj $(OBJ_D)\dh_err.obj $(OBJ_D)\dh_depr.obj \
	$(OBJ_D)\dh_ameth.obj $(OBJ_D)\dh_pmeth.obj $(OBJ_D)\dh_prn.obj \
	$(OBJ_D)\dh_rfc5114.obj $(OBJ_D)\dh_kdf.obj $(OBJ_D)\ec_lib.obj \
	$(OBJ_D)\ecp_smpl.obj $(OBJ_D)\ecp_mont.obj $(OBJ_D)\ecp_nist.obj \
	$(OBJ_D)\ec_cvt.obj $(OBJ_D)\ec_mult.obj $(OBJ_D)\ec_err.obj \
	$(OBJ_D)\ec_curve.obj $(OBJ_D)\ec_check.obj $(OBJ_D)\ec_print.obj \
	$(OBJ_D)\ec_asn1.obj $(OBJ_D)\ec_key.obj $(OBJ_D)\ec2_smpl.obj \
	$(OBJ_D)\ec2_mult.obj $(OBJ_D)\ec_ameth.obj $(OBJ_D)\ec_pmeth.obj \
	$(OBJ_D)\eck_prn.obj $(OBJ_D)\ecp_nistp224.obj $(OBJ_D)\ecp_nistp256.obj \
	$(OBJ_D)\ecp_nistp521.obj $(OBJ_D)\ecp_nistputil.obj $(OBJ_D)\ecp_oct.obj \
	$(OBJ_D)\ec2_oct.obj $(OBJ_D)\ec_oct.obj $(OBJ_D)\ecp_nistz256.obj \
	$(OBJ_D)\ecp_nistz256-x86_64.obj $(OBJ_D)\ech_lib.obj $(OBJ_D)\ech_ossl.obj \
	$(OBJ_D)\ech_key.obj $(OBJ_D)\ech_err.obj $(OBJ_D)\ech_kdf.obj \
	$(OBJ_D)\ecs_lib.obj $(OBJ_D)\ecs_asn1.obj $(OBJ_D)\ecs_ossl.obj \
	$(OBJ_D)\ecs_sign.obj $(OBJ_D)\ecs_vrf.obj $(OBJ_D)\ecs_err.obj \
	$(OBJ_D)\buffer.obj $(OBJ_D)\buf_str.obj $(OBJ_D)\buf_err.obj \
	$(OBJ_D)\bio_lib.obj $(OBJ_D)\bio_cb.obj $(OBJ_D)\bio_err.obj \
	$(OBJ_D)\bss_mem.obj $(OBJ_D)\bss_null.obj $(OBJ_D)\bss_fd.obj \
	$(OBJ_D)\bss_file.obj $(OBJ_D)\bss_sock.obj $(OBJ_D)\bss_conn.obj \
	$(OBJ_D)\bf_null.obj $(OBJ_D)\bf_buff.obj $(OBJ_D)\b_print.obj \
	$(OBJ_D)\b_dump.obj $(OBJ_D)\b_sock.obj $(OBJ_D)\bss_acpt.obj \
	$(OBJ_D)\bf_nbio.obj $(OBJ_D)\bss_log.obj $(OBJ_D)\bss_bio.obj \
	$(OBJ_D)\bss_dgram.obj $(OBJ_D)\stack.obj $(OBJ_D)\lhash.obj \
	$(OBJ_D)\lh_stats.obj $(OBJ_D)\md_rand.obj $(OBJ_D)\randfile.obj \
	$(OBJ_D)\rand_lib.obj $(OBJ_D)\rand_err.obj $(OBJ_D)\rand_egd.obj \
	$(OBJ_D)\rand_win.obj $(OBJ_D)\rand_unix.obj $(OBJ_D)\rand_os2.obj \
	$(OBJ_D)\rand_nw.obj $(OBJ_D)\err.obj $(OBJ_D)\err_all.obj \
	$(OBJ_D)\err_prn.obj $(OBJ_D)\o_names.obj $(OBJ_D)\obj_dat.obj \
	$(OBJ_D)\obj_lib.obj $(OBJ_D)\obj_err.obj $(OBJ_D)\obj_xref.obj \
	$(OBJ_D)\encode.obj $(OBJ_D)\digest.obj $(OBJ_D)\evp_enc.obj \
	$(OBJ_D)\evp_key.obj $(OBJ_D)\evp_acnf.obj $(OBJ_D)\evp_cnf.obj \
	$(OBJ_D)\e_des.obj $(OBJ_D)\e_bf.obj $(OBJ_D)\e_idea.obj \
	$(OBJ_D)\e_des3.obj $(OBJ_D)\e_camellia.obj $(OBJ_D)\e_rc4.obj \
	$(OBJ_D)\e_aes.obj $(OBJ_D)\names.obj $(OBJ_D)\e_seed.obj \
	$(OBJ_D)\e_xcbc_d.obj $(OBJ_D)\e_rc2.obj $(OBJ_D)\e_cast.obj \
	$(OBJ_D)\e_rc5.obj $(OBJ_D)\m_null.obj $(OBJ_D)\m_md4.obj \
	$(OBJ_D)\m_md5.obj $(OBJ_D)\m_sha.obj $(OBJ_D)\m_sha1.obj \
	$(OBJ_D)\m_wp.obj $(OBJ_D)\m_dss.obj $(OBJ_D)\m_dss1.obj \
	$(OBJ_D)\m_ripemd.obj $(OBJ_D)\m_ecdsa.obj $(OBJ_D)\p_open.obj \
	$(OBJ_D)\p_seal.obj $(OBJ_D)\p_sign.obj $(OBJ_D)\p_verify.obj \
	$(OBJ_D)\p_lib.obj $(OBJ_D)\p_enc.obj $(OBJ_D)\p_dec.obj \
	$(OBJ_D)\bio_md.obj $(OBJ_D)\bio_b64.obj $(OBJ_D)\bio_enc.obj \
	$(OBJ_D)\evp_err.obj $(OBJ_D)\e_null.obj $(OBJ_D)\c_all.obj \
	$(OBJ_D)\c_allc.obj $(OBJ_D)\c_alld.obj $(OBJ_D)\evp_lib.obj \
	$(OBJ_D)\bio_ok.obj $(OBJ_D)\evp_pkey.obj $(OBJ_D)\evp_pbe.obj \
	$(OBJ_D)\p5_crpt.obj $(OBJ_D)\p5_crpt2.obj $(OBJ_D)\e_old.obj \
	$(OBJ_D)\pmeth_lib.obj $(OBJ_D)\pmeth_fn.obj $(OBJ_D)\pmeth_gn.obj \
	$(OBJ_D)\m_sigver.obj $(OBJ_D)\e_aes_cbc_hmac_sha1.obj $(OBJ_D)\e_aes_cbc_hmac_sha256.obj \
	$(OBJ_D)\e_rc4_hmac_md5.obj $(OBJ_D)\a_object.obj $(OBJ_D)\a_bitstr.obj \
	$(OBJ_D)\a_utctm.obj $(OBJ_D)\a_gentm.obj $(OBJ_D)\a_time.obj \
	$(OBJ_D)\a_int.obj $(OBJ_D)\a_octet.obj $(OBJ_D)\a_print.obj \
	$(OBJ_D)\a_type.obj $(OBJ_D)\a_set.obj $(OBJ_D)\a_dup.obj \
	$(OBJ_D)\a_d2i_fp.obj $(OBJ_D)\a_i2d_fp.obj $(OBJ_D)\a_enum.obj \
	$(OBJ_D)\a_utf8.obj $(OBJ_D)\a_sign.obj $(OBJ_D)\a_digest.obj \
	$(OBJ_D)\a_verify.obj $(OBJ_D)\a_mbstr.obj $(OBJ_D)\a_strex.obj \
	$(OBJ_D)\x_algor.obj $(OBJ_D)\x_val.obj $(OBJ_D)\x_pubkey.obj \
	$(OBJ_D)\x_sig.obj $(OBJ_D)\x_req.obj $(OBJ_D)\x_attrib.obj \
	$(OBJ_D)\x_bignum.obj $(OBJ_D)\x_long.obj $(OBJ_D)\x_name.obj \
	$(OBJ_D)\x_x509.obj $(OBJ_D)\x_x509a.obj $(OBJ_D)\x_crl.obj \
	$(OBJ_D)\x_info.obj $(OBJ_D)\x_spki.obj $(OBJ_D)\nsseq.obj \
	$(OBJ_D)\x_nx509.obj $(OBJ_D)\d2i_pu.obj $(OBJ_D)\d2i_pr.obj \
	$(OBJ_D)\i2d_pu.obj $(OBJ_D)\i2d_pr.obj $(OBJ_D)\t_req.obj \
	$(OBJ_D)\t_x509.obj $(OBJ_D)\t_x509a.obj $(OBJ_D)\t_crl.obj \
	$(OBJ_D)\t_pkey.obj $(OBJ_D)\t_spki.obj $(OBJ_D)\t_bitst.obj \
	$(OBJ_D)\tasn_new.obj $(OBJ_D)\tasn_fre.obj $(OBJ_D)\tasn_enc.obj \
	$(OBJ_D)\tasn_dec.obj $(OBJ_D)\tasn_utl.obj $(OBJ_D)\tasn_typ.obj \
	$(OBJ_D)\tasn_prn.obj $(OBJ_D)\ameth_lib.obj $(OBJ_D)\f_int.obj \
	$(OBJ_D)\f_string.obj $(OBJ_D)\n_pkey.obj $(OBJ_D)\f_enum.obj \
	$(OBJ_D)\x_pkey.obj $(OBJ_D)\a_bool.obj $(OBJ_D)\x_exten.obj \
	$(OBJ_D)\bio_asn1.obj $(OBJ_D)\bio_ndef.obj $(OBJ_D)\asn_mime.obj \
	$(OBJ_D)\asn1_gen.obj $(OBJ_D)\asn1_par.obj $(OBJ_D)\asn1_lib.obj \
	$(OBJ_D)\asn1_err.obj $(OBJ_D)\a_bytes.obj $(OBJ_D)\a_strnid.obj \
	$(OBJ_D)\evp_asn1.obj $(OBJ_D)\asn_pack.obj $(OBJ_D)\p5_pbe.obj \
	$(OBJ_D)\p5_pbev2.obj $(OBJ_D)\p8_pkey.obj $(OBJ_D)\asn_moid.obj \
	$(OBJ_D)\pem_sign.obj $(OBJ_D)\pem_seal.obj $(OBJ_D)\pem_info.obj \
	$(OBJ_D)\pem_lib.obj $(OBJ_D)\pem_all.obj $(OBJ_D)\pem_err.obj \
	$(OBJ_D)\pem_x509.obj $(OBJ_D)\pem_xaux.obj $(OBJ_D)\pem_oth.obj \
	$(OBJ_D)\pem_pk8.obj $(OBJ_D)\pem_pkey.obj $(OBJ_D)\pvkfmt.obj \
	$(OBJ_D)\x509_def.obj $(OBJ_D)\x509_d2.obj $(OBJ_D)\x509_r2x.obj \
	$(OBJ_D)\x509_cmp.obj $(OBJ_D)\x509_obj.obj $(OBJ_D)\x509_req.obj \
	$(OBJ_D)\x509spki.obj $(OBJ_D)\x509_vfy.obj $(OBJ_D)\x509_set.obj \
	$(OBJ_D)\x509cset.obj $(OBJ_D)\x509rset.obj $(OBJ_D)\x509_err.obj \
	$(OBJ_D)\x509name.obj $(OBJ_D)\x509_v3.obj $(OBJ_D)\x509_ext.obj \
	$(OBJ_D)\x509_att.obj $(OBJ_D)\x509type.obj $(OBJ_D)\x509_lu.obj \
	$(OBJ_D)\x_all.obj $(OBJ_D)\x509_txt.obj $(OBJ_D)\x509_trs.obj \
	$(OBJ_D)\by_file.obj $(OBJ_D)\by_dir.obj $(OBJ_D)\x509_vpm.obj \
	$(OBJ_D)\v3_bcons.obj $(OBJ_D)\v3_bitst.obj $(OBJ_D)\v3_conf.obj \
	$(OBJ_D)\v3_extku.obj $(OBJ_D)\v3_ia5.obj $(OBJ_D)\v3_lib.obj \
	$(OBJ_D)\v3_prn.obj $(OBJ_D)\v3_utl.obj $(OBJ_D)\v3err.obj \
	$(OBJ_D)\v3_genn.obj $(OBJ_D)\v3_alt.obj $(OBJ_D)\v3_skey.obj \
	$(OBJ_D)\v3_akey.obj $(OBJ_D)\v3_pku.obj $(OBJ_D)\v3_int.obj \
	$(OBJ_D)\v3_enum.obj $(OBJ_D)\v3_sxnet.obj $(OBJ_D)\v3_cpols.obj \
	$(OBJ_D)\v3_crld.obj $(OBJ_D)\v3_purp.obj $(OBJ_D)\v3_info.obj \
	$(OBJ_D)\v3_ocsp.obj $(OBJ_D)\v3_akeya.obj $(OBJ_D)\v3_pmaps.obj \
	$(OBJ_D)\v3_pcons.obj $(OBJ_D)\v3_ncons.obj $(OBJ_D)\v3_pcia.obj \
	$(OBJ_D)\v3_pci.obj $(OBJ_D)\pcy_cache.obj $(OBJ_D)\pcy_node.obj \
	$(OBJ_D)\pcy_data.obj $(OBJ_D)\pcy_map.obj $(OBJ_D)\pcy_tree.obj \
	$(OBJ_D)\pcy_lib.obj $(OBJ_D)\v3_asid.obj $(OBJ_D)\v3_addr.obj \
	$(OBJ_D)\v3_scts.obj $(OBJ_D)\cms_lib.obj $(OBJ_D)\cms_asn1.obj \
	$(OBJ_D)\cms_att.obj $(OBJ_D)\cms_io.obj $(OBJ_D)\cms_smime.obj \
	$(OBJ_D)\cms_err.obj $(OBJ_D)\cms_sd.obj $(OBJ_D)\cms_dd.obj \
	$(OBJ_D)\cms_cd.obj $(OBJ_D)\cms_env.obj $(OBJ_D)\cms_enc.obj \
	$(OBJ_D)\cms_ess.obj $(OBJ_D)\cms_pwri.obj $(OBJ_D)\cms_kari.obj \
	$(OBJ_D)\conf_err.obj $(OBJ_D)\conf_lib.obj $(OBJ_D)\conf_api.obj \
	$(OBJ_D)\conf_def.obj $(OBJ_D)\conf_mod.obj $(OBJ_D)\conf_mall.obj \
	$(OBJ_D)\conf_sap.obj $(OBJ_D)\txt_db.obj $(OBJ_D)\pk7_asn1.obj \
	$(OBJ_D)\pk7_lib.obj $(OBJ_D)\pkcs7err.obj $(OBJ_D)\pk7_doit.obj \
	$(OBJ_D)\pk7_smime.obj $(OBJ_D)\pk7_attr.obj $(OBJ_D)\pk7_mime.obj \
	$(OBJ_D)\bio_pk7.obj $(OBJ_D)\p12_add.obj $(OBJ_D)\p12_asn.obj \
	$(OBJ_D)\p12_attr.obj $(OBJ_D)\p12_crpt.obj $(OBJ_D)\p12_crt.obj \
	$(OBJ_D)\p12_decr.obj $(OBJ_D)\p12_init.obj $(OBJ_D)\p12_key.obj \
	$(OBJ_D)\p12_kiss.obj $(OBJ_D)\p12_mutl.obj $(OBJ_D)\p12_utl.obj \
	$(OBJ_D)\p12_npas.obj $(OBJ_D)\pk12err.obj $(OBJ_D)\p12_p8d.obj \
	$(OBJ_D)\p12_p8e.obj $(OBJ_D)\comp_lib.obj $(OBJ_D)\comp_err.obj \
	$(OBJ_D)\c_rle.obj $(OBJ_D)\c_zlib.obj $(OBJ_D)\eng_err.obj \
	$(OBJ_D)\eng_lib.obj $(OBJ_D)\eng_list.obj $(OBJ_D)\eng_init.obj \
	$(OBJ_D)\eng_ctrl.obj $(OBJ_D)\eng_table.obj $(OBJ_D)\eng_pkey.obj \
	$(OBJ_D)\eng_fat.obj $(OBJ_D)\eng_all.obj $(OBJ_D)\tb_rsa.obj \
	$(OBJ_D)\tb_dsa.obj $(OBJ_D)\tb_ecdsa.obj $(OBJ_D)\tb_dh.obj \
	$(OBJ_D)\tb_ecdh.obj $(OBJ_D)\tb_rand.obj $(OBJ_D)\tb_store.obj \
	$(OBJ_D)\tb_cipher.obj $(OBJ_D)\tb_digest.obj $(OBJ_D)\tb_pkmeth.obj \
	$(OBJ_D)\tb_asnmth.obj $(OBJ_D)\eng_openssl.obj $(OBJ_D)\eng_cnf.obj \
	$(OBJ_D)\eng_dyn.obj $(OBJ_D)\eng_cryptodev.obj $(OBJ_D)\eng_rdrand.obj \
	$(OBJ_D)\ocsp_asn.obj $(OBJ_D)\ocsp_ext.obj $(OBJ_D)\ocsp_ht.obj \
	$(OBJ_D)\ocsp_lib.obj $(OBJ_D)\ocsp_cl.obj $(OBJ_D)\ocsp_srv.obj \
	$(OBJ_D)\ocsp_prn.obj $(OBJ_D)\ocsp_vfy.obj $(OBJ_D)\ocsp_err.obj \
	$(OBJ_D)\ui_err.obj $(OBJ_D)\ui_lib.obj $(OBJ_D)\ui_openssl.obj \
	$(OBJ_D)\ui_util.obj $(OBJ_D)\ui_compat.obj $(OBJ_D)\krb5_asn.obj \
	$(OBJ_D)\pqueue.obj $(OBJ_D)\wp_dgst.obj $(OBJ_D)\wp-x86_64.obj \
	$(OBJ_D)\ts_err.obj $(OBJ_D)\ts_req_utils.obj $(OBJ_D)\ts_req_print.obj \
	$(OBJ_D)\ts_rsp_utils.obj $(OBJ_D)\ts_rsp_print.obj $(OBJ_D)\ts_rsp_sign.obj \
	$(OBJ_D)\ts_rsp_verify.obj $(OBJ_D)\ts_verify_ctx.obj $(OBJ_D)\ts_lib.obj \
	$(OBJ_D)\ts_conf.obj $(OBJ_D)\ts_asn1.obj $(OBJ_D)\srp_lib.obj \
	$(OBJ_D)\srp_vfy.obj $(OBJ_D)\e_4758cca.obj $(OBJ_D)\e_aep.obj \
	$(OBJ_D)\e_atalla.obj $(OBJ_D)\e_cswift.obj $(OBJ_D)\e_gmp.obj \
	$(OBJ_D)\e_chil.obj $(OBJ_D)\e_nuron.obj $(OBJ_D)\e_sureware.obj \
	$(OBJ_D)\e_ubsec.obj $(OBJ_D)\e_padlock.obj $(OBJ_D)\e_capi.obj \
	$(OBJ_D)\e_gost_err.obj $(OBJ_D)\gost2001_keyx.obj $(OBJ_D)\gost2001.obj \
	$(OBJ_D)\gost89.obj $(OBJ_D)\gost94_keyx.obj $(OBJ_D)\gost_ameth.obj \
	$(OBJ_D)\gost_asn1.obj $(OBJ_D)\gost_crypt.obj $(OBJ_D)\gost_ctl.obj \
	$(OBJ_D)\gost_eng.obj $(OBJ_D)\gosthash.obj $(OBJ_D)\gost_keywrap.obj \
	$(OBJ_D)\gost_md.obj $(OBJ_D)\gost_params.obj $(OBJ_D)\gost_pmeth.obj \
	$(OBJ_D)\gost_sign.obj 

T_EXE=$(TEST_D)\constant_time_test.exe \
	$(TEST_D)\md4test.exe $(TEST_D)\md5test.exe $(TEST_D)\shatest.exe \
	$(TEST_D)\sha1test.exe $(TEST_D)\sha256t.exe $(TEST_D)\sha512t.exe \
	$(TEST_D)\hmactest.exe $(TEST_D)\rmdtest.exe $(TEST_D)\destest.exe \
	$(TEST_D)\rc2test.exe $(TEST_D)\rc4test.exe $(TEST_D)\bftest.exe \
	$(TEST_D)\casttest.exe $(TEST_D)\bntest.exe $(TEST_D)\exptest.exe \
	$(TEST_D)\rsa_test.exe $(TEST_D)\dsatest.exe $(TEST_D)\dhtest.exe \
	$(TEST_D)\ectest.exe $(TEST_D)\ecdhtest.exe $(TEST_D)\ecdsatest.exe \
	$(TEST_D)\randtest.exe $(TEST_D)\evp_test.exe $(TEST_D)\evp_extra_test.exe \
	$(TEST_D)\verify_extra_test.exe $(TEST_D)\v3nametest.exe $(TEST_D)\enginetest.exe \
	$(TEST_D)\wp_test.exe $(TEST_D)\srptest.exe $(TEST_D)\ssltest.exe \
	$(TEST_D)\heartbeat_test.exe $(TEST_D)\clienthellotest.exe $(TEST_D)\sslv2conftest.exe \
	$(TEST_D)\dtlstest.exe $(TEST_D)\bad_dtls_test.exe $(TEST_D)\fatalerrtest.exe \
	$(TEST_D)\igetest.exe 

E_SHLIB=

###################################################################
all: banner $(TMP_D) $(BIN_D) $(TEST_D) $(LIB_D) $(INCO_D) headers lib exe 

banner:
	@echo Building OpenSSL

$(TMP_D):
	$(MKDIR) "$(TMP_D)"
# NB: uncomment out these lines if BIN_D, TEST_D and LIB_D are different
#$(BIN_D):
#	$(MKDIR) $(BIN_D)
#
#$(TEST_D):
#	$(MKDIR) $(TEST_D)

$(LIB_D):
	$(MKDIR) "$(LIB_D)"

$(INCO_D): $(INC_D)
	$(MKDIR) "$(INCO_D)"

$(INC_D):
	$(MKDIR) "$(INC_D)"

# This needs to be invoked once, when the makefile is first constructed, or
# after cleaning.
init: $(TMP_D) $(LIB_D) $(INC_D) $(INCO_D) $(BIN_D) $(TEST_D) headers
	$(PERL) $(SRC_D)/util/copy-if-different.pl "$(SRC_D)/crypto/opensslconf.h" "$(INCO_D)/opensslconf.h"

headers: $(HEADER) $(EXHEADER)

lib: $(LIBS_DEP) $(E_SHLIB)

exe: $(T_EXE) $(BIN_D)\$(E_EXE).exe

$(TMP_D)\x86_64cpuid.asm: crypto\x86_64cpuid.pl
	set ASM=$(ASM)
	$(PERL) crypto\x86_64cpuid.pl $@

$(TMP_D)\md5-x86_64.asm: crypto\md5\asm\md5-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\md5\asm\md5-x86_64.pl $@

$(TMP_D)\sha1-x86_64.asm: crypto\sha\asm\sha1-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\sha\asm\sha1-x86_64.pl $@

$(TMP_D)\sha256-x86_64.asm: crypto\sha\asm\sha512-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\sha\asm\sha512-x86_64.pl $@

$(TMP_D)\sha512-x86_64.asm: crypto\sha\asm\sha512-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\sha\asm\sha512-x86_64.pl $@

$(TMP_D)\sha1-mb-x86_64.asm: crypto\sha\asm\sha1-mb-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\sha\asm\sha1-mb-x86_64.pl $@

$(TMP_D)\sha256-mb-x86_64.asm: crypto\sha\asm\sha256-mb-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\sha\asm\sha256-mb-x86_64.pl $@

$(TMP_D)\rc4-x86_64.asm: crypto\rc4\asm\rc4-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\rc4\asm\rc4-x86_64.pl $@

$(TMP_D)\rc4-md5-x86_64.asm: crypto\rc4\asm\rc4-md5-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\rc4\asm\rc4-md5-x86_64.pl $@

$(TMP_D)\aes-x86_64.asm: crypto\aes\asm\aes-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\aes\asm\aes-x86_64.pl $@

$(TMP_D)\vpaes-x86_64.asm: crypto\aes\asm\vpaes-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\aes\asm\vpaes-x86_64.pl $@

$(TMP_D)\bsaes-x86_64.asm: crypto\aes\asm\bsaes-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\aes\asm\bsaes-x86_64.pl $@

$(TMP_D)\aesni-x86_64.asm: crypto\aes\asm\aesni-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\aes\asm\aesni-x86_64.pl $@

$(TMP_D)\aesni-sha1-x86_64.asm: crypto\aes\asm\aesni-sha1-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\aes\asm\aesni-sha1-x86_64.pl $@

$(TMP_D)\aesni-sha256-x86_64.asm: crypto\aes\asm\aesni-sha256-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\aes\asm\aesni-sha256-x86_64.pl $@

$(TMP_D)\aesni-mb-x86_64.asm: crypto\aes\asm\aesni-mb-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\aes\asm\aesni-mb-x86_64.pl $@

$(TMP_D)\cmll-x86_64.asm: crypto\camellia\asm\cmll-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\camellia\asm\cmll-x86_64.pl $@

$(TMP_D)\ghash-x86_64.asm: crypto\modes\asm\ghash-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\modes\asm\ghash-x86_64.pl $@

$(TMP_D)\aesni-gcm-x86_64.asm: crypto\modes\asm\aesni-gcm-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\modes\asm\aesni-gcm-x86_64.pl $@

$(TMP_D)\x86_64-mont.asm: crypto\bn\asm\x86_64-mont.pl
	set ASM=$(ASM)
	$(PERL) crypto\bn\asm\x86_64-mont.pl $@

$(TMP_D)\x86_64-mont5.asm: crypto\bn\asm\x86_64-mont5.pl
	set ASM=$(ASM)
	$(PERL) crypto\bn\asm\x86_64-mont5.pl $@

$(TMP_D)\x86_64-gf2m.asm: crypto\bn\asm\x86_64-gf2m.pl
	set ASM=$(ASM)
	$(PERL) crypto\bn\asm\x86_64-gf2m.pl $@

$(TMP_D)\rsaz-x86_64.asm: crypto\bn\asm\rsaz-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\bn\asm\rsaz-x86_64.pl $@

$(TMP_D)\rsaz-avx2.asm: crypto\bn\asm\rsaz-avx2.pl
	set ASM=$(ASM)
	$(PERL) crypto\bn\asm\rsaz-avx2.pl $@

$(TMP_D)\ecp_nistz256-x86_64.asm: crypto\ec\asm\ecp_nistz256-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\ec\asm\ecp_nistz256-x86_64.pl $@

$(TMP_D)\wp-x86_64.asm: crypto\whrlpool\asm\wp-x86_64.pl
	set ASM=$(ASM)
	$(PERL) crypto\whrlpool\asm\wp-x86_64.pl $@

asms: $(TMP_D) $(TMP_D)\x86_64cpuid.asm $(TMP_D)\md5-x86_64.asm $(TMP_D)\sha1-x86_64.asm $(TMP_D)\sha256-x86_64.asm $(TMP_D)\sha512-x86_64.asm $(TMP_D)\sha1-mb-x86_64.asm $(TMP_D)\sha256-mb-x86_64.asm $(TMP_D)\rc4-x86_64.asm $(TMP_D)\rc4-md5-x86_64.asm $(TMP_D)\aes-x86_64.asm $(TMP_D)\vpaes-x86_64.asm $(TMP_D)\bsaes-x86_64.asm $(TMP_D)\aesni-x86_64.asm $(TMP_D)\aesni-sha1-x86_64.asm $(TMP_D)\aesni-sha256-x86_64.asm $(TMP_D)\aesni-mb-x86_64.asm $(TMP_D)\cmll-x86_64.asm $(TMP_D)\ghash-x86_64.asm $(TMP_D)\aesni-gcm-x86_64.asm $(TMP_D)\x86_64-mont.asm $(TMP_D)\x86_64-mont5.asm $(TMP_D)\x86_64-gf2m.asm $(TMP_D)\rsaz-x86_64.asm $(TMP_D)\rsaz-avx2.asm $(TMP_D)\ecp_nistz256-x86_64.asm $(TMP_D)\wp-x86_64.asm
