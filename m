Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703125;
	b=5cn+JFpDggKPwgivq0sifuxP4BKuBGuQ9XdQ0+MvEbQEKjrkwtnJ52B8caZFb6toP8lW
	 gha7/D19x3aUCyvK+3KujGjqm556w5AOz61jzkDi7dUCxPc9X7JhUgh0huzVZ9Fwui63U
	 x8krE4LpTwCZzPZRC5YYSEY/L/+FhEUMt0/XlrIUo02z2P1a1+k9O0yQMBEAPvuRPTXb6
	 eRmpkl+rmnCFyYNd9fK8TBM9YJHFfhkU4jQa8ZvT4PayGxwNQxjJLMKkPk/5qaXjroP7W
	 aXGyBBOzSGNh0EcjbtjOICumBwTThTZvMAmErKqlGpsqhniMl8Rj/8L0hq1rif/31lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703125;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=H5zkqfQoeOfPLc0Fph11IuhRFwwTxZaLPfQOnohC7U0=;
	b=oYJjS6u3g29cP6pXT/1PznrhJAYYIwt51+yWYwFw9t+OaEfzCa7ylqqllVzgSZZ/qJxz
	 a7+L0f/PRD3YT6Pa8QSt2BXmLUp//pUd9glC9EO2yfFNTvcT4qo58tuM0JnDqw8Ig/yHg
	 vMqn1d8e/uOvILMK7qOi9d58E4Y0hyZcvpmn0yLeHHe/InuLI6/NzwyfDjHUd0/rDz/BE
	 eeu9zIOmPWac0BrAxI5D3Xo2tL418jZc16xLI/Q34rgKSkR7wzfbhrNIcjqtx+nKdJsbL
	 93ceCb4/ohR691nJCU8ezZ/6GkVoPBa7ARNU+vT9KMrNVdMTxQZC6kr8Lo5edC1Sr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eurlFfKO;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8000606A32A
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8000606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eurlFfKO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795703123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5zkqfQoeOfPLc0Fph11IuhRFwwTxZaLPfQOnohC7U0=;
	b=eurlFfKOo0EezQ81RAfSXtnGlJLhhCISW5i0SIg0e1hmBxYw638/NYBeJ2L+iC78V6yMnH
	RBpg7hJs8ivLt/JWdbDI/cyjKUtDUemV3NE58wWAZIWQft/tRumgI643xolN+dGP1GpBkM
	do68GziupXEukg8bKHimUFmQ/Xnbzaw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-Xk8obbVmNCarHLiK_jO5ZA-1; Thu, 26 Nov 2026 14:25:21 +0000
X-MC-Unique: Xk8obbVmNCarHLiK_jO5ZA-1
X-Mimecast-MFC-AGG-ID: Xk8obbVmNCarHLiK_jO5ZA_1795703120
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so5864465f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703120; x=1796307920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H5zkqfQoeOfPLc0Fph11IuhRFwwTxZaLPfQOnohC7U0=;
        b=tc2yoPGxrKjmZaw+XJHtzdzFOoL1qXPiY4VG8gFE4TvY8d+dIIM4dg1CzBezN0g5iw
         mEdaTsMJnGll3eyLL0esOf1/uCibOvg+txl8rSPXCfXIUZAM7D/TUbbPJa8VprHY7+Im
         LzuLfRh5Ig5cNUlWJ9LbId+MgDsGjIU6ZoEoktwNn1otC3zGkoO+fmtZViQOVnMJQMWG
         wiq/sNbvU4+vTG6KpkkkL9FBu8gn2GOAYnhGYeHKOpXyXCK0zvV7+DhKUsQyPWgsNz4L
         Chy9D8wroPI3XHnkSZS12CwUsSHAC/gNpGjk1GViJQQtIgvuSJwORAvmvSu4LAi4Gi0+
         s26A==
X-Gm-Message-State: APuU4Z/NbuaeTYryG6GdUNWNtwkwPqCwvPEqiUiPLRxb9F5CQ1skM91y
	fUmiDslDNano4dtC2x5SLnLQwvGfoPoKoyI0dJru/6Lt2rwvlHUm9S3Iri5f2QzluYKKg0Ern2A
	cXCf5XlW7jCrM9uYtVaN7Ef3LLRTzHhd58Qh9hUDSCm07K4wZZdq6SXT7M/qEcgSsMWxmhb8OEf
	aE+UtWtFbEsyQrnufh95iI7mpdYqGqGBlNftp8OPGiN17C4dc=
X-Gm-Gg: AZFdTZff4SMIbRT0ecpjjYF1JDWFMGvHd+o3yJbm+iQ3yieonnXOcmWaqTdATuz0zUv
	ZsPXtC5gvG6MUjhOVqpvZdDXFflnXRyddQPsUER+B9bYtQdcqwHrhuS/XU+nlqvonxzGQLjrnGi
	/i03DfwZzA0R8+Yce7KLsIU5L9a71wmFarus87mR6TsTsANcHzH9TZfKr4qE0zrR6hTS7TsxdH0
	Hc/Y+RXtqBeUJ+NQNI+xnc4jGkkTzvEjE8QsBP7/WLFoJK1uXaYMNJua3ORMu2mAZy6ntMg/zS9
	mhCBsoKxgr3nRak+F6beeHVTHsAza4dIwnZm7+ZkgV+HAKH5y3GT/cDlNrtHT6Z9Q39WIPyCtCF
	doJPUSJBJyUi2168W6vphDK75PENukUI/5uH2DICu+yRr5RN4Qj8AyThgTDrGRSsOm9aZoM/Mmx
	YT+2Aky2nYk0y8FS4NgG0x5r4mn1z2u+f6fVXBH0lj
X-Received: by 2002:a05:6000:2dc7:b0:4b7:6d41:eba1 with SMTP id ffacd0b85a97d-4b76d41fcfbmr18913297f8f.18.1795703120101;
        Thu, 26 Nov 2026 06:25:20 -0800 (PST)
X-Received: by 2002:a05:6000:2dc7:b0:4b7:6d41:eba1 with SMTP id ffacd0b85a97d-4b76d41fcfbmr18913215f8f.18.1795703119494;
        Thu, 26 Nov 2026 06:25:19 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm40768370f8f.42.2026.11.26.06.25.17
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:25:18 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 6/6] fuse: reject FUSE_NOTIFY_STORE on a DAX inode
Date: Thu, 26 Nov 2026 15:25:06 +0100
Message-ID: <20261126142512.219535-6-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126142512.219535-1-mszeredi@redhat.com>
References: <20261126142512.219535-1-mszeredi@redhat.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1q7v24kKNWBrSaX9WaqAZ3VDnB6KWTqHvmPExk-E3iE_1795703120
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Reject the notification; a server sending it for a DAX inode is violating
the protocol, so fail loudly.

Fixes: e8bc74b6ed1b ("fuse: add extent map I/O support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-e5888530-95f5-48f1-887a-d601b1f2bf87
Signed-off-by: Miklos Szeredi <miklos@szeredi.hu>
---
 fs/fuse/notify.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 984e4945e3e3..272423dfd261 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -167,6 +167,14 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 		err = -EINVAL;
 		goto out_iput;
 	}
+	/*
+	 * A dax inode has no page cache: its mapping holds dax entries, which
+	 * must never be mixed with folios.
+	 */
+	if (IS_DAX(inode)) {
+		err = fuse_EIO("NOTIFY_STORE on DAX inode");
+		goto out_iput;
+	}
 
 	mapping = inode->i_mapping;
 	file_size = i_size_read(inode);
-- 
2.56.1

