Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421427;
	b=iTwMxTn7NouGJZpPpMfqbKqJsnsg5CPV6eMhgiX/leTmX2U8hSSMGBMFnXr3wBU7yFVp
	 LMQPtZYM1xBuNK0tMBnXuHoOohjKrgOEnu3gCQtxkNnXtcXxlRF7LhfUlIq2dCTt84649
	 BVAqmelJTApdx9qsKfI7wovBBZ5A7QyHKx/8h2C9O4XIku3ShfGB0xsqFVOE8sxnIh4wO
	 IxyFQcd2X2CyponUvZv79cJE3o6mEz4ggORaA3CONMtS7KstTCDFQ3R96QNN62x9JWPkU
	 V7/ZICKnB6L554AEnvtAf/Frqm69QVKeUThIPwqZSyjuvcbmK5mKv8EkEhJD34VJxbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421427;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VC9fbS3spXtMbntjH4frJjqNa7VOVXuSqmW18xxyX40=;
	b=vYuS21+w4PuP0A7YcOJ8Xok46obVI2hkNNuv2u4VpmQcOrgT6khC/Yml+AIWcXpD7EMy
	 2Zc2naLbuW3vHo+toB+VN5yFBUPpFupyYodvaHgGt1ve46HS2wqC17SNGaeUTigRBJPkd
	 DciO+v9xgxKxub6wpQwxRrBnbC46Vzism/ZntEka2oTaUijeOurSEAJuHo5icJdOaXxfo
	 07Yo6asR+/gtJRTmPZmIFKiGJJ7dbKUQTOAXSWQopbREFQY5SuXiIYNUJgIQzeCEpM0gE
	 apC/ZU1MM0mPJ4TEeYhHnAkXnE4SKS7hSGDJXxRkjOJi9L0KQ1UoPzRhJODxXLqBptQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98021606A69B
	for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 08:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98021606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 507bb8f4e71511f19a56ed5b684f684d-20261123
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a9b9b240-ad7a-425d-a62d-1e27bfb38b07,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:a9b9b240-ad7a-425d-a62d-1e27bfb38b07,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:a23c61323ad01a09f71475aaca0d1676,BulkI
	D:261123161020XU7LRQH6,BulkQuantity:0,SF:17|19|38|66|78|102|127|136|153|86
	5|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2|1,URL:0,File:nil,RT:nil,
	Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_IBB,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 507bb8f4e71511f19a56ed5b684f684d-20261123
X-User: liwang@kylinos.cn
Received: from computer.. [(116.128.244.169)] by mailgw.kylinos.cn
	(envelope-from <liwang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 751022257; Mon, 23 Nov 2026 16:10:15 +0800
From: Li Wang <liwang@kylinos.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Li Wang <liwang@kylinos.cn>
Subject: [PATCH] Documentation: note that fuse request timeouts do not apply to virtiofs
Date: Mon, 23 Nov 2026 16:09:28 +0800
Message-Id: <20261123080928.83356-1-liwang@kylinos.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fs/fuse/default_request_timeout and max_request_timeout are global and
stay writable. They arm the timeout for FUSE connections other than
virtiofs. virtiofs is the exception, and that exception was introduced
by commit '16fabae51accb1057582dcfe758fb1a8a852a07c ("virtiofs: disable 
request timeout")': the kernel sets fuse_conn::no_req_timeout and never 
consults these sysctls, because the timeout aborts the connection and 
frees requests the virtqueue still owns.

The sysctl text describes that abort as applying to a fuse server.  Record
the virtiofs exception at the end of the section.

Signed-off-by: Li Wang <liwang@kylinos.cn>
---
 Documentation/admin-guide/sysctl/fs.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
index 9b7f65c3efd8..e7ac4a38ab3e 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -372,3 +372,10 @@ the set timeout elapses, then the connection to the fuse server will be aborted.
 Please note that the timeouts are not 100% precise (eg you may set 60 seconds but
 the timeout may kick in after 70 seconds). The upper margin of error for the
 timeout is roughly FUSE_TIMEOUT_TIMER_FREQ seconds.
+
+virtiofs does not use these timeouts.  The kernel does not offer
+``FUSE_REQUEST_TIMEOUT`` and does not arm the timer from either sysctl,
+because a timeout aborts the connection while the device still owns the
+request.  Writing ``default_request_timeout`` or ``max_request_timeout``
+has no effect on a virtiofs mount.  Both files remain writable because they
+still apply to other FUSE connections.
-- 
2.34.1

