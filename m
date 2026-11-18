Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017282;
	b=fXbpbfqhXAzTOVcLcRmT33fdbMMm3mswT6Qgbe3jvwK4xmMQEHCshagbWpyYrGH0eRcD
	 D32SwBqgXcgUAYXaHak2ePBUh8+glWdixqdLK1wvowux3uNh/Zyln+vuvH+eYHVUxuppx
	 n3ITWBWVj+qnvVneyrJS7xcOUVitaXxVwMvWZqVwaqmXYpShudwU4pjSanaP7YtIYu3N/
	 UgJQKNC7SPG+G4XJTqHKDGX8OJuVszseADt8ttXCC1NRPg37UCDn1UoEKjUACOrHRf7ng
	 LgxKIX66BnJCNYq56nm0DooGj42OW4aCuQnzJ62qrnSOhaFn/JmsiOO+ozQHTcDJGnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017282;
	h=DMARC-Filter:X-Originating-IP:X-Works-Smtp-Source:Received:
	 DKIM-Signature:X-Session-ID:MIME-Version:Message-ID:Date:From:
	 Importance:To:Cc:Subject:X-Originating-IP:X-Works-Send-Opt:
	 Content-Type:Content-Transfer-Encoding;
	bh=A0pQAgaHccuRhxgHaaE9wYPFsrqIKo+SuMixMJFMl7o=;
	b=uEUTtYP7WUET4khGJPF8RfstjaJglqj85o/6GmbSi+Brm0rmIrJAFvdD+FGNq5yBHNwU
	 JXabYdSvoaXWp16natkMxTPKF2k9CpWEpNYeHJgc3G0G3jHWKxH0rbaRSjW+TvslMcoOk
	 DPFVUQzD+zLeEhyYvCuUBOKexyizuxX/0KJD5FU1G3/cJnRz0DX407QVGxtSszT5ur0SK
	 R9J6Xzsh+phdFASaWW/RBlYrbBv/K8khXjWT2OCO9eoFKNz4oCMyh7GY/UHUfkCXc9Dal
	 5xTqunr8+oFrR8c9FdkgiIa/qOIRh1Gfjs/XBEYXuMdPgx5JivpgCZpyAUVOKjtJZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=foecKHN4;
	arc=none smtp.remote-ip=114.111.35.108
Received: from cvsmtppost18.nm.naver.com (cvsmtppost18.nm.naver.com [114.111.35.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1025606A32F
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 15:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1025606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=foecKHN4
X-Works-Smtp-Source: zXn/axtlFqJCpNmdFq2dWHF0
Received: from nv1m-hmac-real-14 ([10.174.201.121])
  by cvsmtppost18.nm.naver.com with ESMTP id rKSnSOdRStKJeKICyTT1zg
  for <multiple recipients>;
  Wed, 18 Nov 2026 15:54:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1795017274; bh=A0pQAgaHccuRhxgHaaE9wYPFsrqIKo+SuMixMJFMl7o=;
	h=Message-ID:Date:From:To:Subject:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=foecKHN4wrbD994eE2U2wXpKOFjbbu9lxIISf2c7h6YA5R4nk8oOrLjZHn5Ax4E5E
	 rQxI+G3HGPcs0M72S6ALBaQrHXThAc/oFB6JWxyzRhC9ZlvpZJeI+wCubZzq3w/cRQ
	 XZIdDDYqMYp7z936tL42FXh4TDa0Xgz5e6FqZ4GTkyMY07SYUj1xvG+pnPPhfYxBmh
	 ZVGdK7dIKexOM2RhNo99AI+3RBFwK/Ua00YprYGKEcDSqOHU5DKnAsfVn3BEO0TpzT
	 bg5F+ZqaLbU0nlTo+SwhFI7JbK6rKlwFG2bhAQZJveL3pfZO4qPkWAVAsJ4cP6X869
	 hUxEdJqur/lsg==
X-Session-ID: 1c6ac6cd7c90a75bda16e79551adbc2c607217018d0495bc93d8c9df47ab9c60
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Message-ID: <2a2eb8c6a3fc9d6e2dbdc4e5bb8c956e@cweb004.nm>
Date: Thu, 19 Nov 2026 00:54:33 +0900
From: =?utf-8?B?U2lldW4gWWFuZw==?= <didtldms2525@naver.com>
Importance: normal
To: <bernd@bsbernd.com>,
	<joannelkoong@gmail.com>
Cc: <miklos@szeredi.hu>,
	<fuse-devel@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?W1BBVENIXSBmdXNlOiBlbmZvcmNlIGZpbGUgbW9kZXMgZm9yIGlvX3VyaW5nIGNvbW1hbg==?=
	=?utf-8?B?ZHM=?=
X-Works-Send-Opt: +dedpz0vjHmZFxiqW63nFBmmjApYKxtwFA2wKqbqaBwtxBmwjAg=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T3JkaW5hcnkgcmVhZCgpIGFuZCB3cml0ZSgpIGVuZm9yY2UgRk1PREVfUkVBRCBhbmQgRk1PREVf
V1JJVEUgYmVmb3JlCnJlYWNoaW5nIEZVU0UuIElPUklOR19PUF9VUklOR19DTUQgZG9lcyBub3Qs
IGFuZCBGVVNFJ3MgY29tbWFuZCBoYW5kbGVyCmRvZXMgbm90IGNoZWNrIGVpdGhlciBtb2RlLiBS
RUdJU1RFUiBjYW4gdGhlcmVmb3JlIGRlbGl2ZXIgcmVxdWVzdHMKdGhyb3VnaCBhbiBPX1dST05M
WSBjb25uZWN0aW9uLiBDT01NSVRfQU5EX0ZFVENIIGFsc28gZW50ZXJzIGl0cwpyZXBseS1hbmQt
ZmV0Y2ggcGF0aCB0aHJvdWdoIGFuIE9fUkRPTkxZIGNvbm5lY3Rpb24uCgpUaGlzIGNhbiBleHBv
c2UgZGF0YSB0byBhIHByb2Nlc3MgZ2l2ZW4gb25seSBhIHdyaXRlLW9ubHkgRlVTRQpjb25uZWN0
aW9uLiBPbiA3LjQuMC1yYzMtZzIwZWVmMjliN2M4NCB3aXRoIGZ1c2UuZW5hYmxlX3VyaW5nPTEs
CnVpZCAxMDAwIHJlY2VpdmVkIGEgRlVTRV9XUklURSByZXF1ZXN0IGNvbnRhaW5pbmcgMzYgYnl0
ZXMgd3JpdHRlbiBieQp1aWQgMjAwMCBhZnRlciBiZWluZyBwYXNzZWQgb25seSBhbiBPX1dST05M
WSBjb25uZWN0aW9uIGZkLiBPcmRpbmFyeQpyZWFkKCkgb24gdGhhdCBmZCByZXR1cm5lZCBFQkFE
RiwgYW5kIG5ldyBPX1JET05MWSBhbmQgT19SRFdSIG9wZW5zIG9mCi9kZXYvZnVzZSB3ZXJlIGRl
bmllZC4gVGhlIG1vdW50IHVzZWQgZGVmYXVsdF9wZXJtaXNzaW9ucyBhbmQgYSBmaWxlCm93bmVk
IGJ5IHVpZCAyMDAwIHdpdGggbW9kZSAwMjAwLgoKUmVxdWlyZSBGTU9ERV9SRUFEIGZvciBSRUdJ
U1RFUi4gQ09NTUlUX0FORF9GRVRDSCBib3RoIHN1Ym1pdHMgYSByZXBseQphbmQgZmV0Y2hlcyB0
aGUgbmV4dCByZXF1ZXN0LCBzbyByZXF1aXJlIEZNT0RFX1JFQUQgYW5kIEZNT0RFX1dSSVRFLgpU
aGUgc2FtZSB0ZXN0IHJldHVybmVkIEVCQURGIGZvciBSRUdJU1RFUiB3aXRoIHRoZSBjaGFuZ2Ug
YXBwbGllZC4KCkZpeGVzOiAyNGZlOTYyYzg2ZjUgKCJmdXNlOiB7aW8tdXJpbmd9IEhhbmRsZSBT
UUVzIC0gcmVnaXN0ZXIgY29tbWFuZHMiKQpGaXhlczogYzA5MGM4YWJhZTRiICgiZnVzZTogQWRk
IGlvLXVyaW5nIHNxZSBjb21taXQgYW5kIGZldGNoIHN1cHBvcnQiKQpDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBTaWV1biBZYW5nIDxkaWR0bGRtczI1MjVAam51LmFj
LmtyPgotLS0KIGZzL2Z1c2UvZGV2X3VyaW5nLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvZnVzZS9kZXZfdXJpbmcuYyBiL2ZzL2Z1
c2UvZGV2X3VyaW5nLmMKaW5kZXggNDYwNzc2Y2Q2Li40ODEzNjhhYzkgMTAwNjQ0Ci0tLSBhL2Zz
L2Z1c2UvZGV2X3VyaW5nLmMKKysrIGIvZnMvZnVzZS9kZXZfdXJpbmcuYwpAQCAtMTY5OCw2ICsx
Njk4LDggQEAgaW50IGZ1c2VfdXJpbmdfY21kKHN0cnVjdCBpb191cmluZ19jbWQgKmNtZCwgdW5z
aWduZWQgaW50IGlzc3VlX2ZsYWdzKQogCiAJc3dpdGNoIChjbWRfb3ApIHsKIAljYXNlIEZVU0Vf
SU9fVVJJTkdfQ01EX1JFR0lTVEVSOgorCQlpZiAoIShjbWQtPmZpbGUtPmZfbW9kZSAmIEZNT0RF
X1JFQUQpKQorCQkJcmV0dXJuIC1FQkFERjsKIAkJZXJyID0gZnVzZV91cmluZ19yZWdpc3Rlcihj
bWQsIGlzc3VlX2ZsYWdzLCBmY2gpOwogCQlpZiAoZXJyKSB7CiAJCQlwcl9pbmZvX29uY2UoIkZV
U0VfSU9fVVJJTkdfQ01EX1JFR0lTVEVSIGZhaWxlZCBlcnI9JWRcbiIsCkBAIC0xNzA4LDYgKzE3
MTAsOSBAQCBpbnQgZnVzZV91cmluZ19jbWQoc3RydWN0IGlvX3VyaW5nX2NtZCAqY21kLCB1bnNp
Z25lZCBpbnQgaXNzdWVfZmxhZ3MpCiAJCX0KIAkJYnJlYWs7CiAJY2FzZSBGVVNFX0lPX1VSSU5H
X0NNRF9DT01NSVRfQU5EX0ZFVENIOgorCQlpZiAoKGNtZC0+ZmlsZS0+Zl9tb2RlICYgKEZNT0RF
X1JFQUQgfCBGTU9ERV9XUklURSkpICE9CisJCSAgICAoRk1PREVfUkVBRCB8IEZNT0RFX1dSSVRF
KSkKKwkJCXJldHVybiAtRUJBREY7CiAJCWVyciA9IGZ1c2VfdXJpbmdfY29tbWl0X2ZldGNoKGNt
ZCwgaXNzdWVfZmxhZ3MsIGZjaCk7CiAJCWlmIChlcnIpIHsKIAkJCXByX2luZm9fb25jZSgiRlVT
RV9JT19VUklOR19DT01NSVRfQU5EX0ZFVENIIGZhaWxlZCBlcnI9JWRcbiIsCgpiYXNlLWNvbW1p
dDogMjBlZWYyOWI3Yzg0NjVhYzk4ZDdkZDZkNmYyYWMwN2E4ZDgwNTZjYQotLSAKMi4zOS41Cg==
