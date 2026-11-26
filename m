Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704460;
	b=AHJi3X8kVrZCgt32jKB9LpZabcz8dtDuvbIz10YiKmUOBQQtssdfv48n5PHcFnJN6Prl
	 8MnEw0YMJCsbH0EryPgZQRHcQhwDTqxpt2W+FkEaLXfuMqcpP56K7WKEF3xncSTZcbGZi
	 RAGJhi5w+v9tTeD/HhHgDQK9TkpPNrnXmi1kqbGgzso+g1UVh2MnSXg158V5fFEN/Mimp
	 0obwH4m2fC8/mUbDCPXv6iTgZltTlOgt1xdiSSBDR8Bb6hnSu++Xn53NAkuqswZpLfsXS
	 c7eaXwZcmdPDeS7UQ5LhLXCmEMXuWZpeQTGxiGvzj7SWryZvWPvbIVSFvqBU9K5h42w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704460;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=oPelpeMc/+MkSLr4S1p7e6tz+07RqqWkjj6mkjgV26Q=;
	b=iOK7TvDcwa2uquQUoAlx2tVHqNrT431hlBjdlQ7olFTDuE0GCyhZcsQVoIZIBB4Q8SG6
	 KdXgVvDmkeyoCj28swu7SlhyARj5IevAQyY6qa1J0AQ0T0Nf00/fKGkqa12GZXhgJrvHe
	 vKzqMUcrlAzKFpN9fWqj4C0SiG1mUTMxo4LoqrUZ7ZBDiXQx116+bBgWBvh0a895EZSxV
	 W6FWdcH4FON2/xSkMx7/Wd5PtY7SGcSiXKgC+G6VKTrYpwlGZyzgAUasYe7Ve5m7BEVQJ
	 vFMLe3eyQIAV7+P8nvutrx/HH1PeVQEGGVsx4D48Sm5rzsG/X6ZBXWtXXGHTukYDvIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A8Z64EVc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A258606A31C
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A258606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A8Z64EVc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795704456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPelpeMc/+MkSLr4S1p7e6tz+07RqqWkjj6mkjgV26Q=;
	b=A8Z64EVc7i4YQKUQO3ZpDV77B9gJNdT7F1jyUk4KI0UfnmwYa9pLb8cFNJTNcsPGUgE/Fz
	/YVW/lO+83MkOpVh16AtixFNkVapxxPWMjKuAVvHJbv3Cr2POxB1KekC/oPWK/NUq6lVy4
	Q3qgZO2kYt+LAoQEyhJ5/EZ/XJnbw8A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-iAHmUu3eMmWKSFkDt2lTBA-1; Thu, 26 Nov 2026 14:47:28 +0000
X-MC-Unique: iAHmUu3eMmWKSFkDt2lTBA-1
X-Mimecast-MFC-AGG-ID: iAHmUu3eMmWKSFkDt2lTBA_1795704444
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb67b2c00cso40847515e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704444; x=1796309244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPelpeMc/+MkSLr4S1p7e6tz+07RqqWkjj6mkjgV26Q=;
        b=tGUSBffwQAXi4Rn4TUOoNO5XMw1UWRomL40bVETqxKpzSEtKRPfJTxPoocPPK1eImB
         hnN+gvoXFiFbOIu6SXa8+8l4UtRAz4QdEW7DARptQXqoUN+X4txMuAogz+4y7npKSz/O
         MCu7w90iD93LA9uLoKMspe1GK126KFn3soItiKa2OCCD8KZbSdsPquaQleE5bluiZlve
         8SFvS80EBnURErZk0ft3b78guPVQ9KeduTfVmXNdAoB6Lh3vJhA4oPFTKX+I/CZxpBuX
         mgReTf3Iui99tgKV9y8Ck/xPmN1L7cWRRyTJKmZrenquBGHGKnhJUUazQoZM1ZGWeEso
         lSNQ==
X-Gm-Message-State: APuU4Z+BNHhExVpCDha9v64U9MZ0LiRoRKUfBlz63QMVwnBUPE3zP3cI
	IwjOeEM1eU/FQ+QWQ4H+Bl7fyDAInCu2j9QTAV7/ygeoX8sad6wTPIZhuxTqftarF7O/49ECwAp
	rU7vsVITNbJ8lToZrvpjDSs+FCinZrs6cvobUuJuDtj2a9OcYB0lvMZ2+2aj75ng561/AcNu9Gn
	UZ41y9Iwq7aGaZaBYYeCw2BdnbskfX5WlFIAePl7D8wLpLlts=
X-Gm-Gg: AZFdTZduW0KzMP9DgUzTRF7l5orLVavtjjUdmtoP2//nKsqCgnMIbfD0uWamxipFrtQ
	bycNZg4AfX+x1ZDktsGKSPL84LyM7eDiOja8f0l9pUlJhYmj20x12AdcOzXDExK/dNR1tPY8f/l
	oo0o026tsvyBMqjNUKyXLsWRqWXGlvsx8OlHcit4aG6YajfU9HzwlgdRsi98FjjaQU917Ryh+bV
	iefxJe53DYbmFs5Uhzt58N7TlqWaDcymgPzAm9Uba4LMg6Px+2MImNegz/Ho3XYHi9QfAK2XEpO
	L/S1HbDvSdPnizNckhXXROyPHH9Eg159Uu8991rLUhnBFeNHdAL4Cyw3wvq5tJCmsKEvNdHps9j
	v4Iaobl9XAFjbgHh0bOiRxJO7zuKAGsKKt6UYbza2RwTCHHVMBsGXc5v64woA8YkBNLUngB1F9o
	wgBrWHDbDUJx6R8N97/MDFUPr0ANQnrMf7KRJQZf0U
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr454871785e9.14.1795704443957;
        Thu, 26 Nov 2026 06:47:23 -0800 (PST)
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr454871155e9.14.1795704443442;
        Thu, 26 Nov 2026 06:47:23 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm388114905e9.0.2026.11.26.06.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:47:22 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev
Cc: Li Wang <liwang@kylinos.cn>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 3/5] virtiofs: retry request submission from the worker on -ENOMEM
Date: Thu, 26 Nov 2026 15:47:16 +0100
Message-ID: <20261126144719.232329-3-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126144719.232329-1-mszeredi@redhat.com>
References: <20261126144719.232329-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: VOLt1q-EmKDmnkZY6vVmlwwpnR8-kg9zlyjj2tSpEps_1795704444
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

virtio_fs_send_req() enqueues with GFP_ATOMIC, because it may be called
with fc->chan->bg_lock held.  copy_args_to_argbuf() allocates the bounce
buffer with those flags, so under memory pressure a request can be
failed with -ENOMEM even though nothing is wrong with it.  The buffer is
as large as the request arguments, so this is not limited to tiny
allocations: FUSE_REMOVEMAPPING, for example, can ask for just over
4 KiB, an order-1 allocation out of the atomic reserves with no reclaim.

A virtqueue that is merely full is already handled gracefully: -ENOSPC
puts the request on fsvq->queued_reqs and virtio_fs_request_dispatch_work()
retries it with GFP_KERNEL under memalloc_nofs_save().  A failed atomic
allocation is just as transient, so treat it the same way instead of
ending the request.  Unlike -ENOSPC there is no completion to kick the
worker afterwards, so schedule it here.

virtio_fs_enqueue_req() queues on -ENOSPC only after checking
fsvq->connected under fsvq->lock; do the same here and fail the request
with -ENOTCONN if the queue is gone.  req->argbuf has already been freed
and cleared on the error path, so the retry reallocates it.

Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/virtio_fs.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 8bd63c6165d2..6ddb2f181a16 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1586,6 +1586,23 @@ static void virtio_fs_send_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 			 */
 			return;
 		}
+		if (ret == -ENOMEM) {
+			/*
+			 * Only the GFP_ATOMIC allocation failed.  Hand the
+			 * request to the dispatch worker, which retries with
+			 * GFP_KERNEL, rather than failing it outright.
+			 */
+			spin_lock(&fsvq->lock);
+			if (fsvq->connected) {
+				list_add_tail(&req->list, &fsvq->queued_reqs);
+				inc_in_flight_req(fsvq);
+				schedule_work(&fsvq->dispatch_work);
+				spin_unlock(&fsvq->lock);
+				return;
+			}
+			spin_unlock(&fsvq->lock);
+			ret = -ENOTCONN;
+		}
 		req->out.h.error = ret;
 		pr_err("virtio-fs: virtio_fs_enqueue_req() failed %d\n", ret);
 
-- 
2.56.1

