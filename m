Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891390;
	b=4vO09SjZeiiiTkILDWcMDL59f7Mxgq76a8LvLTVDbdKkI/2rwIPbzpU/sRVh9Abts5mK
	 zsS7PdBE7PvMgUU7VZ+a9S1FA6/g0iIE89hrGeV3ZH+JcELeB8XJNQnUsBN3FWq4F0to5
	 U0JthQMl1mNa43QU8lqBMMQI3S0IH946yPz2U/B/V0dBhdZgyPhIGBsabh9cr4rLJzeiL
	 RPBRP84H+nIv+J6ySgbEvlfAS2/hH/QX3UYgXXL/+rfzOnhq21xWufz2eitP89n3h/Eob
	 /KpvWaBGaAAhE9anCZiuTTx0VsgF70Smv84xukf+xxxGrFi+y/ylhWwsTZpb0vTUbsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891390;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=6igLeCdyvx1mvf1ZSjuMUxGb5XzaqkxPYrbkgHbNZGI=;
	b=c6NzxypipA3RrQIybi3dO1F2tcnxmP8d1nnk3zN5ALzOm67VVO83uE/U83Ex89scsrbi
	 03Z0sQlHga80aBRmUW3RQA9txg+1TGvnoPSn8Mgy/wAivlBFj0QyWdGC4EGGCs9C3wnDk
	 o9wipRg+CxbhWqLp7OU2T2fRQrjW4T3yoaGRPO28q6tnaZeQmJpdZwkxfaE512og+G/0r
	 d5w1JQW8pHgPfGfi4HCINCxMDfluEQ62NgeAOC2HZe8UpAfkfdenWXUDGu0zwHcjTlEi8
	 F9CDcH9jRXiQZ9xFDhWGqtsBtNHvwcFGU2xjBiC0wEnJPmjozOH+8teennghMdQg2UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Bf+reH0/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8987A606D804
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 15:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8987A606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bf+reH0/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6igLeCdyvx1mvf1ZSjuMUxGb5XzaqkxPYrbkgHbNZGI=;
	b=Bf+reH0/kYJaEnfgsb9fbRjOvZN5OkZvK/uI/Ff9AH87Ql5N/Rk3qqHoc9H+Er3Ptqpv59
	Z2BUqbJ9clVHnWeKHQ2ljefSbKBBTSl1pM/APSuXo0sGuw7Vygt/77u0mvOpLGP2TsxLq9
	7par2yZaWexJtY4UgZq6r0jvxYfGnis=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-7P-DZAyBNV6R6mGWICiDlg-1; Thu, 05 Nov 2026 10:09:47 -0500
X-MC-Unique: 7P-DZAyBNV6R6mGWICiDlg-1
X-Mimecast-MFC-AGG-ID: 7P-DZAyBNV6R6mGWICiDlg_1793891386
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so16185505e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 07:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891386; x=1794496186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6igLeCdyvx1mvf1ZSjuMUxGb5XzaqkxPYrbkgHbNZGI=;
        b=i4MhyeS9IaQVu1HfNoN8/5DZifVACnDEfIGUW6dt+xvg0qqnHGfqaON0Yw+uJG6UiS
         Vb9exsVvUZG+FF03bUqAMSQNfS2MC64geqj1mBFW+69m7VTVA4V/+VmJNTt5zr51geJh
         8q7voI9uBDLCzIcJ7Gs4UJ/srIkT2OZiLbkYtvU1YnVz61tNS4/4R5XON2JOxPijpkwl
         KC7Dpgit8aVFQTTrTh0JS1MX0isE9K9hIajTSSlT230/0X0wOeblkYf/2ocllwS/SeT9
         F0r2RFkQQiJ11uKp2ofokSNDF9NxaYdnqWuI+4otZQQl6ruqvxoaH2nOYwtP2HOaKzes
         +hhA==
X-Gm-Message-State: APuU4Z/EsSIBA7tHXrrbkJ5GQEarPwNW9YVTUE/iikUL1KYYXQk2p0vq
	a5dWhRR5Rqs839yQayJQW11OYRpcxmgveBsMh6aaz1k4TARnr/mRFeZs+v688UlWBDrXejvXV29
	4w/fsx8YTxYvPecLEbm1ShvDc6PP16BG+w3QTJ02RFAsvaWwor0jBg5DQqfRoEuGo2xxz6z1Cym
	B/TPzvDef+Js2Naiq5niudrbtaf37/tnUicBB+8nsFFsBkt88=
X-Gm-Gg: AYBFou1jOWMoTMzax6U0vympomJjkyKc8tj/STcqUh5v0zlY4WxTf9E89ngu1tqMdgm
	+8u7G1u7XSvOA4/LkxzF7WL+KhGMRZFh/5cxmv3l+vXKaGR5AuiCn1TIWMBE6lO4bov6G/9PWR5
	4YVHutnooa+uZmQcu8ASIKkwAJ9s8vSSyXy1w+5sLRJb5glkg4ko9f5fQVW+TXaIBepEJaPhTkT
	a24ImdOMNJGm14abmISu3uh8xx049qY84MsaidCCeW0MVLPoQSfCWkCHcUuC5TQjrW9J47QipJa
	RDLJe/xbguPxVzjto+EAxqMehvHzkfIRXdfIAcvrc1XN7qqJaMGxxp+P3zQDTDYDDB1Hg2GzNt/
	Gzmt4bEqW3IInQtDVhVxxgSwCvkjAkMATkbgNvCFkL98dBUHHZN/kn+66P0Z9SULbu1NaomHRVY
	gIKz37pflFH/e7OsIJXcJuFebqrp80qbXt1dyLyzgvY6A=
X-Received: by 2002:a05:600c:674a:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ac14ec788emr427673985e9.3.1793891386241;
        Thu, 05 Nov 2026 07:09:46 -0800 (PST)
X-Received: by 2002:a05:600c:674a:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ac14ec788emr427673555e9.3.1793891385879;
        Thu, 05 Nov 2026 07:09:45 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm9961340f8f.52.2026.11.05.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:09:44 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH 0/3] virtiofs: fix sashiko reported bugs
Date: Thu,  5 Nov 2026 16:09:39 +0100
Message-ID: <20261105150943.86650-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
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
X-Mimecast-MFC-PROC-ID: oqdrLRAbMgTamFjd6SSrJpfJs5U-X_smhfiLh6vMt6E_1793891386
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

---
Miklos Szeredi (3):
  virtiofs: fix use-after-free of fs->tag on device removal
  virtiofs: disable request timeout
  virtiofs: zero the reply region of the argument buffer

 fs/fuse/fuse_i.h    | 10 ++++++++++
 fs/fuse/inode.c     |  9 ++++++---
 fs/fuse/virtio_fs.c | 33 +++++++++++++++++++++++++++------
 3 files changed, 43 insertions(+), 9 deletions(-)

-- 
2.56.0

