Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A1343849F
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458419; cv=none; b=H4OECgd8va/AwzefgdqAH86d9Nxs4ngvu00MR9ZpF5cDr+WKVNkreyDZjMaa24B5ayV434eg4tc5QOnzthqpSpcL1Nf9vOYf3QgESOrO5lVDfflth/p5kSUXytBlVAylGj+KyKlYWYqqxOxmvZa+OdNqjnUri9CvaBSZXow39Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458419; c=relaxed/simple;
	bh=B3VgAzE1fV6NLyqOFguVSmI0qJqk/diBymVTA99Hj50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Ute9Y2MWhv4ZrZrHGp9IRG7mMr7VxnbUGb4reYSuuj/JnRreEboggafDdUuHXMF0bNeFYk7objLaIwnHp0iCQHQubH1/jIcbrwEGNBJ8RRdyo29fZFPJErYB0CunQEo83CV+qThdrdX3wbGtNOhcT5vsufceqxDxflrCYu38qWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SN2FPTTW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SN2FPTTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791458417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eic19mjHB9HL/L+XEW5Q/d+IffJBXxfVI0tTJopOLKE=;
	b=SN2FPTTWMDLypu7OoO+vLw0b6e35PJ/o1uhcAPBy5Js6d9HJS+JUmbvC5kTaIwNU6aD4J1
	fdMHg3xJR0M74uGKvEZ+CaBwOeNa+mdLhucpfE7fDALxPKl4cV7aBGZ7xlQ2L+CKabEb7i
	9MHHcDg+esg5ITU7vXzC8gnmgxZBLcg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-OBhAMzmsM8Gzz9yjYO9xzQ-1; Thu, 8 Oct 2026 11:20:14 +0000
X-MC-Unique: OBhAMzmsM8Gzz9yjYO9xzQ-1
X-Mimecast-MFC-AGG-ID: OBhAMzmsM8Gzz9yjYO9xzQ_1791458413
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c210c66672eso233903866b.2
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 04:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458413; x=1792063213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eic19mjHB9HL/L+XEW5Q/d+IffJBXxfVI0tTJopOLKE=;
        b=v/Lz2n/7hRpp9L+2eeKXlNRv/rJjg96KgNe/3nj/TZHbOR2q21iCRF4brziiuzupwa
         N5svIB+9LNMSCE4dkcM9zdxGnixscUGJIufJUwIgQ/CA/iEcgvSaMB5CgEXk+bn1ljT8
         gIiahhIstJJh4a460KMjMI38AkuPc/DkZ6kZDBEbo4NIIr27CpOsgYi5pDJ0qkhSEahj
         GXgdz+WdkRNriWEV5CmdRwhjd+7LSGq1sXp+qC6hkPf07LoS87giWNALaTbquoHNlD4w
         phBMeNCA+/Mbj+UbtMILbhMZckTzOhq+1webBEL1BOlNF8pnFOGSyaiUibKdkNgIWaVh
         2Tcg==
X-Gm-Message-State: AFuF++kGNiDTOuh5tSiq+hG0yKBwfa23J6Vu4iZMChn4RDUt+1ORtREm
	ftLQ5yaCifM67bN/WezkY7K/biKxapT/UTqbweRl980jndwKlIKirVQtQ+DPfR6G7ZjIEdsyVrA
	9p2LqYlCrsB2sRGfhgyHYAT9CUUHmNuAdfjyqbA7h+xXD4VKYFwPzxUbbhyaXBCGqso1duo7fpo
	7Ah8I9wakKF2R0htBiA5RxwHlZPDGD0n/D0jdXNNfVBtX04Os=
X-Gm-Gg: AYBFou0rzFfP0B61xreHe8xFDJkmgagM09nODM99HsmcfanAVvN0WwGMaLxTDXOFFl+
	P13gmkPbep48NDHZtoSis90WF4IrtuEkBGbZqMF5Ho8OY6EuMA2f5T38lxJEOfPuNhVYybBNbdg
	VPLtB4NDbzgYy46z2DzBXki3OvZwwxoZrLnbvEA6f6lHjHVCukrSH1vMI/7yxQtCBeTLj4uz8di
	k0RtBYhYUeZKcnp48l6krlkYc4nfV2PACN9JyehvjlyGqs3UR/OHDu6DIVJBTUQwjwCRreW2cLh
	+LJxhK4vFR0BNphyTqRcFi5Qyk70okmk/zJk8HVJGdcxXV+JihkeEGKHXRP8+3aCAvD1Z1cUmZe
	D3Ta+B4C24NUV7lzTtJ04VyUcZfXvUWOAWB5mChjIJa0ADv1YUdLxEpfM
X-Received: by 2002:a17:907:1ca2:b0:c2e:969:a4b0 with SMTP id a640c23a62f3a-c317c11a3efmr469400366b.38.1791458413170;
        Thu, 08 Oct 2026 04:20:13 -0700 (PDT)
X-Received: by 2002:a17:907:1ca2:b0:c2e:969:a4b0 with SMTP id a640c23a62f3a-c317c11a3efmr469397066b.38.1791458412617;
        Thu, 08 Oct 2026 04:20:12 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2fae53sm204251866b.49.2026.10.08.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:20:11 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: [PATCH v4 2/9] dax: use READ_ONCE() in dax_holder()
Date: Thu,  8 Oct 2026 13:19:53 +0200
Message-ID: <20261008112004.1899560-3-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008112004.1899560-1-mszeredi@redhat.com>
References: <20261008112004.1899560-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VOUtC09PvjP-qxJ0PtqdKcw6TWswf_mQeb9k-q_MV8w_1791458413
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

A future fuse patch will utilize dax_holder() in RCU context to make sure
that the holder can't be freed by a racing fs_put_dax.

This patch just makes sure that dax_holder() works properly in such a
context by adding READ_ONCE() (equivalent to rcu_dereference minus sanity
checks).

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 drivers/dax/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 25836f389bde..76e8d3654629 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -642,7 +642,7 @@ EXPORT_SYMBOL_GPL(put_dax);
  */
 void *dax_holder(struct dax_device *dax_dev)
 {
-	return dax_dev->holder_data;
+	return READ_ONCE(dax_dev->holder_data);
 }
 EXPORT_SYMBOL_GPL(dax_holder);
 
-- 
2.54.0

