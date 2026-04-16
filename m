Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82339A066
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331054; cv=none; b=MGacPIYfoBjUPtXcg3XcsG4jSdyf3VW6J3OQJIEmjYBp0rQNFuZJ6XVEJgayQLieIDZDEBUSSgqw/AQpqyaE5SfvNwAbvuDvL0ArdZ59e/XTbpqKPPdh4rUC2tKtEtQOg1avInIdjTBxN6Y5cIOjkle/ek0WkqeOYOkZlpqpKtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331054; c=relaxed/simple;
	bh=VYbmk5wPV9lXRDsmNlYt1YZLM2GJtwYMuhFMxXwb2as=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=OaiaIQJXiywZrlqdCg+r5Kj7/ss5HU5+KWny4iQzSDKRV1PnubjnvwvsAnw/aY0eS5SXuLMhVdfhuUxz9PpSf1WIWmFVHTqEGBtAT+Fg4tJtETiGw4jUvK8kwc18vZQbmZKkX9I+F87OZmDBUYRgK+RbPoKks3u7QQ65cdBP/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQTczmPk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQTczmPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqIgMyXT00pZ75/hzPEqZu5A+QPVl1ZSN6dj/sJjgT0=;
	b=SQTczmPkp7444/DbQNOUfCt6XUly3Wf/02ZTQ7fYesKcjgFMbMe6qED3Z9d8RNr3ztuS6K
	WQ6HOqZjaePOedp5f8BLdR7Y2c17KrUKn80gWLgxYUGmDQFQ2zsFEzX0tfZ9agjruVgfii
	xcKUu8xrQYexdGh35Aof3wbqfhBJbz0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-vR13v1jQP0ub1Msc1IgLiA-1; Thu, 16 Apr 2026 05:17:26 -0400
X-MC-Unique: vR13v1jQP0ub1Msc1IgLiA-1
X-Mimecast-MFC-AGG-ID: vR13v1jQP0ub1Msc1IgLiA_1776331045
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso70670145e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331045; x=1776935845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oqIgMyXT00pZ75/hzPEqZu5A+QPVl1ZSN6dj/sJjgT0=;
        b=FWUdbPWYmMs1it466IynI+inYBR7E4sAizC4+/wUPIk+jt4pZm0WQrW8Ts+4xvxHKl
         NHJv43oL17uOdoxJl6A6On+8vWvIYdZz9BQSzb9MChJkJkSTFLGBZao0P20Wx4DC96qz
         8Le8RgTQMvP3PJAMoTdgYyag5QOMi0WwBcxo7FnYDpOuSZkzUJ+ydS1MaoUm29/o648Y
         rhqdB9+Zk9QB4UpbXxFjYYdbi35/bM+vkK0Zp9ob0dyA+1DnVtyktdjfufPmF3PSxlMr
         sjJuM/OF6j//36oTWlKj6nsjTRSIn3URtoy0VYTQgQWJAWGk4q8IW7y96Hrlq8P1RzRq
         hoVg==
X-Gm-Message-State: AOJu0YxeOp67n6w3HYnojCrjJ6FR4YE/yFoF98aC7LVFwrhl+WlWqKh9
	OmQk6tDBBGm6f756FWIA93B4R0pRJLpqlLJytC9NrtWPC9MPSbLGBIpbCl4GvGkK9QAr5OrRc1W
	qNvDt1QnKo9vrWnTZhcr/50qJ1y2mb9zwkKnawXfOwlJdwJpiRQhhcDytVHvQ0Use3qEu5R08IH
	36/2VZMgG0pVvzdmgKQXzPXdjKJLQeRHWy5gvT4om1tYPiEEs=
X-Gm-Gg: AeBDievu+4zVx3w0nJfOEmRsDRKPeoeZ9G6GT/KlDFnwYmGd1x/1zXK2By6GKroYFYm
	MmB3tAtVSKUi5/7mP2pqK3tCwL02qF2MRoX1A6GEyEzkR1UVP6LdEHeQO9BXiVcaBtQZ5yYQ4Cb
	hko8mEd9f2aD30ZKPeftQ0dgPb7IKwz8QPcGbSNWo3IhJ/CJMlsUHq5ZCEj9armde8fGbj6Tjn0
	AXdcJSCU9I5llbCKZlnC2djeMqAoAQzgLxgb2K1/Fo5JbsfLwWuGsabY6PzJpHaeNwEN8PDolvE
	9UOAOQNe0rlZHZmH1Hx4rMDNMGNR15RIgFfPKZXnPNQ1i5d9LaS1lVllKxnxMPXNA7ODtYKlOeY
	2qNkb8mZMCUJ+kdgdrpp3On1rgEIJWYg2nsEyIsPwV7JC3tK59F/REEpUVHav7R+SPbPtbaCNFi
	zSbrRHgg==
X-Received: by 2002:a05:600c:8b2f:b0:485:3423:727d with SMTP id 5b1f17b1804b1-488d688d46cmr319158655e9.26.1776331044617;
        Thu, 16 Apr 2026 02:17:24 -0700 (PDT)
X-Received: by 2002:a05:600c:8b2f:b0:485:3423:727d with SMTP id 5b1f17b1804b1-488d688d46cmr319158085e9.26.1776331044097;
        Thu, 16 Apr 2026 02:17:24 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:23 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 16/32] fuse: move fuse_dev_waitq to dev.c
Date: Thu, 16 Apr 2026 11:16:40 +0200
Message-ID: <20260416091658.462783-17-mszeredi@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416091658.462783-1-mszeredi@redhat.com>
References: <20260416091658.462783-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8oP3YSodZwji5iw-fKhsRaE7MYcHQ83ucWMqhvSgnKg_1776331045
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Move wake_up_all(&fuse_dev_waitq) into fuse_dev_install() where it
logically belongs.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dev.c        | 3 +++
 fs/fuse/fuse_dev_i.h | 2 --
 fs/fuse/inode.c      | 6 ++----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 58cfd0b1fd6f..8096c861e853 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -31,6 +31,8 @@
 MODULE_ALIAS_MISCDEV(FUSE_MINOR);
 MODULE_ALIAS("devname:fuse");
 
+static DECLARE_WAIT_QUEUE_HEAD(fuse_dev_waitq);
+
 static struct kmem_cache *fuse_req_cachep;
 
 static void fuse_request_init(struct fuse_mount *fm, struct fuse_req *req)
@@ -480,6 +482,7 @@ void fuse_dev_install(struct fuse_dev *fud, struct fuse_conn *fc)
 	} else {
 		list_add_tail(&fud->entry, &fc->chan->devices);
 		fuse_conn_get(fc);
+		wake_up_all(&fuse_dev_waitq);
 	}
 	spin_unlock(&fc->chan->lock);
 }
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index ef72159eb558..2e1c251572ca 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -13,8 +13,6 @@
 #define FUSE_INT_REQ_BIT (1ULL << 0)
 #define FUSE_REQ_ID_STEP (1ULL << 1)
 
-extern struct wait_queue_head fuse_dev_waitq;
-
 struct fuse_arg;
 struct fuse_args;
 struct fuse_pqueue;
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 85088b0671a9..88a4dc402155 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -34,7 +34,6 @@ MODULE_LICENSE("GPL");
 static struct kmem_cache *fuse_inode_cachep;
 struct list_head fuse_conn_list;
 DEFINE_MUTEX(fuse_mutex);
-DECLARE_WAIT_QUEUE_HEAD(fuse_dev_waitq);
 
 static int set_global_limit(const char *val, const struct kernel_param *kp);
 
@@ -1788,10 +1787,9 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 
 	list_add_tail(&fc->entry, &fuse_conn_list);
 	sb->s_root = root_dentry;
-	if (fud) {
+	if (fud)
 		fuse_dev_install(fud, fc);
-		wake_up_all(&fuse_dev_waitq);
-	}
+
 	mutex_unlock(&fuse_mutex);
 	return 0;
 
-- 
2.53.0

