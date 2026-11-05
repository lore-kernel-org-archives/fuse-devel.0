Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890459;
	b=zSpq/4SioG34558pCN0loPyVQLyzywRTYwh211ukYHzA/UBjXo9IJoG65Eu/BobJtw2/
	 gTMALYZuxsH5UrfCn4ecWeV4qOnwVamRraJptedpD65dnWaUSPStL+WEgSEI49VV0+U6t
	 ERY8G9YWMe/pd9l2SVu1GVIt1+UusnP/PfNi6kBzoZjrwaV3ivIGzAcztlPWkUJftXTxV
	 wJ05abp2kcsa3l7R3n2sZWa+LaIqztBN8nkkQpHto4jebOjYT7Kt1hTCXvVGtva3OHtb3
	 zx/GUszSodCrnQDtSHrYPP+OQKQDknrZZuO2t0rFWbImUhA6kxuSGFO1ZRxOni7WQYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890459;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=KDmDo1zIwKf1kDoo+5UfHTTv0nqQmqvncVjZDKBfgtE=;
	b=b0yzsXq6NAITRRjDcw2DQk0X3wi3cZGAkijZd/9milVbfoI6Gzmr6BoNh6vDZK8g0ewa
	 l+7LL6pJScU5pbdVArKemUte+SzvqZJtDrekY2TlBfRoD3snHp551BVP4SfYoRcDAbdOy
	 LM7JDZjpl8oQ5dQSwX+M/DWmQoe2sK3iPJ8/ZDiyi2aEKRfm7Y8t1G627JsFxkQqNA0EC
	 8TQcTAxVji/NuAo2mAlscfqBmL5CZPVCnAdSv9I0xqwzRsqQ7mLP5vVkjoxGa0Iepv7W8
	 P62813dw6e85aPTrnR5PDvvGm3qaEZYgcUibyY8W7uUSHAzBoM0eNGXWPuVHz53WTMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Cu+IPpY/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26523606A326
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 14:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26523606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cu+IPpY/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDmDo1zIwKf1kDoo+5UfHTTv0nqQmqvncVjZDKBfgtE=;
	b=Cu+IPpY/gWmiz6nrvMQ5AZyJbeVlYxS1R1lztHFW7Pl/T/o6D70HuZNxPSRJx6WnVrHqmn
	UIxfEhX1XL+LiYZECWqPFiPZ2jRwAwDtASJo2W+cO4s5eQWouHYneXCxkv1FLVAeemGuzh
	CJlbx18jnImDh6ASZ8ZjWbdYGTPKsxY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-_JQF_hbsOECrCsqHqkf1eA-1; Thu, 05 Nov 2026 09:54:16 -0500
X-MC-Unique: _JQF_hbsOECrCsqHqkf1eA-1
X-Mimecast-MFC-AGG-ID: _JQF_hbsOECrCsqHqkf1eA_1793890455
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4915ba023d4so627324f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 06:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890455; x=1794495255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDmDo1zIwKf1kDoo+5UfHTTv0nqQmqvncVjZDKBfgtE=;
        b=VDS6Wxo7/NgvAZJQdCiuFOgP6kUV4VKlgpj40tsi/r5Fbvh30GdK02bCTPeTozgnEM
         vVfbmR7Je5Ld3eNvXkTkZxkgc+9SFpELBQVF5fIghixhfSoeGNkVYjqG52PD3Bt2VQhI
         DBWmtdCDxwxlbUJSdROIUs2m/KeRszI+j6TH0Cbi6D1ffkNm/xmT1LpW9q4gIeaz7iu0
         8KUn/Mt4/tvro2PHEcoHgLP37BK4v8hpxXp1O6PnJ+SzN5Hr0nnWDs2p6DZXouaEsXk4
         50wnkMpHNG4ioeE+DOxg/rRCw530nHr4wMIHNOVfDRT+0osjdnMvR5oLNORiykbFzYQ/
         19ng==
X-Gm-Message-State: APuU4Z8z3IHPVr6ISzyf7fSoAfyPoV3EmbDHPkc/KVAZkReRUwgGQUow
	RGFOSH8PLaqOilVN3wprJ1supDy6yov/XGh9t9HhsgxhmXh1MG4fKPGxCHVu53plGjs2CEe+Yxb
	e1K4YNVcbTX2UwR+ezaK6osnYo+stWec3Q+FDOsqyrViO4SaN2XOiJgth8IfS+0+9fF5Q5oI2FS
	vYFFWSnUC2ioyEr2KcwSfh2Brch4OBCMchZoFnCVfAxkVtf1I=
X-Gm-Gg: AYBFou16zUNYmirlh6w+PB4J4tANj4v4gkM6NTDmvbohBsl7gUfVYdOKEuasOfQ8c4O
	3y2OtdhsCAKkAd+qcMvEgeeX3+ttHOrmmi1SNWLlT3uY9b0P8jAWMuxRRC/rRhn8Ru0TITg1RyI
	Fb0xay4uWQWNtJizE/yNXTvg+ncMqlJDJORPaxz176x0f19Ju2fUkKCKqUW0hDu1baHXf97T0li
	sDsqE/QqtAWLlQKiykTOXsh/dzmc4rYPk/7YZCWW85xjA9TSvzTb6lYdcsM/quD1DedrFDpWewr
	w09PUXmIelBjj7D3op6w6Z8ZS0/Aqdl6FE0EBv9N6jFphh/tMedSahtHumtuSltcKEn4Z8OAq01
	4wJ/HpPHVbWIHgzkAMDpEFiqlL0YWOBfb6xQhAolTG4D6QM/MtV++wpnLcHi8IePJg9g6UUlVh3
	rXTpfcN87CeJKYDQT+L0C2k/7wvUZ5yKER5qyv6ryp1H0=
X-Received: by 2002:a05:6000:4311:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-48e6e2ff167mr39495604f8f.34.1793890455442;
        Thu, 05 Nov 2026 06:54:15 -0800 (PST)
X-Received: by 2002:a05:6000:4311:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-48e6e2ff167mr39495569f8f.34.1793890454978;
        Thu, 05 Nov 2026 06:54:14 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm9296429f8f.32.2026.11.05.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:54:14 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/6] fuse: fix possible UAF in fuse_direntplus_link()
Date: Thu,  5 Nov 2026 15:54:06 +0100
Message-ID: <20261105145412.83058-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105145412.83058-1-mszeredi@redhat.com>
References: <20261105145412.83058-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: IpmIbacZQ95HIdJk2HDzHh8GNG-M60xqRIzTQFYBDU8_1793890455
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

In fuse_direntplus_link() a use-after-free occurs on struct fuse_inode when
linking a newly allocated in-lookup dentry during FUSE_READDIRPLUS
processing fails inside d_splice_alias().

When d_in_lookup(dentry) is true, fuse_iget() returns an inode with an
incremented reference count and fi->nlookup, which is then passed to
d_splice_alias(). Inside d_splice_alias_ops(), if the directory inode has
an existing alias and splicing fails with -ELOOP in d_ancestor() or -ESTALE
in __d_unalias(), the function drops the alias reference via dput(new) and
unconditionally consumes the caller's inode reference via iput(inode)
before returning the error pointer.

If the existing alias is concurrently unhashed and dropped, iput(inode)
drops the final inode reference and evicts the inode immediately via
fuse_evict_inode(), sending a FUSE_FORGET request for fi->nlookup and
freeing struct fuse_inode via RCU. Because fuse_direntplus_link()
subsequently checks !IS_ERR(inode) outside an RCU read-side critical
section, it dereferences the freed inode to acquire fi->lock and decrement
fi->nlookup, and its caller parse_dirplusfile() then invokes
fuse_force_forget() on the error return, issuing a duplicate FUSE_FORGET
request to the server.

Fixes: b8bd342d50cb ("fuse: nlookup missing decrement in fuse_direntplus_link")
Cc: stable@vger.kernel.org #v6.6+
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-0a00a32c-3732-46fe-9cdb-3c67a11903cc
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/readdir.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 295cbd645653..f4f9590f8ae5 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -236,9 +236,13 @@ static int fuse_direntplus_link(struct file *file,
 		inode = fuse_iget(dir->i_sb, o->nodeid, o->generation,
 				  &o->attr, ATTR_TIMEOUT(o),
 				  attr_version, evict_ctr);
-		if (!inode)
-			inode = ERR_PTR(-ENOMEM);
+		if (!inode) {
+			d_lookup_done(dentry);
+			dput(dentry);
+			return -ENOMEM;
+		}
 
+		ihold(inode); /* d_splice_alias() eats a reference */
 		alias = d_splice_alias(inode, dentry);
 		d_lookup_done(dentry);
 		if (alias) {
@@ -246,15 +250,15 @@ static int fuse_direntplus_link(struct file *file,
 			dentry = alias;
 		}
 		if (IS_ERR(dentry)) {
-			if (!IS_ERR(inode)) {
-				struct fuse_inode *fi = get_fuse_inode(inode);
+			struct fuse_inode *fi = get_fuse_inode(inode);
 
-				spin_lock(&fi->lock);
-				fi->nlookup--;
-				spin_unlock(&fi->lock);
-			}
+			spin_lock(&fi->lock);
+			fi->nlookup--;
+			spin_unlock(&fi->lock);
+			iput(inode);
 			return PTR_ERR(dentry);
 		}
+		iput(inode);
 	}
 	if (fc->readdirplus_auto)
 		set_bit(FUSE_I_INIT_RDPLUS, &get_fuse_inode(inode)->state);
-- 
2.56.0

