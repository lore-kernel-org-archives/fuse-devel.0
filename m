Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088174;
	b=YhQHDKEiuppa5iNQclWUGbOz0eDhEbS5nqIEl1gwQUVJEvHm+0mL9qsCTejHqGctd/3s
	 T0ubtdFG1ChbHbrcEatxAOf9imLtLjCrTToRKtgKQanEDpMpECW0TCHcOAKNdELbmnj1k
	 VN1b2/LqtpFb+eBSmQK4ONhg0OjZIpXKKTaozWLx8y60KaXVmeqTFTUBtIVk9IMF9BGX8
	 Q3M1rUKfhODt/MHn20JLNiKZ8oVY+loknXpgCsreekacu8SfwYg+n/SCh6xFU122d/T92
	 OB1OIdcIX0Lkoq9gdOFV38+fAtuEElc+eLGDYrGiRbCP8fvUw/RASr3zN613JI16BJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088174;
	h=DMARC-Filter:DKIM-Signature:Date:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=D7ieWAdZhgY7+nwGt61F2fOy1JsFD+leZnNR2qOGpPg=;
	b=ZuBh4xUQ6YbbTyihT71eQydHZsd/2pA0aGL0R0CFmTwwxx0c9vVyavFt3DhR2H7Vvlae
	 BiiN2CW5anppJsJ/l4XipUmh9iJrfZ5ZZBDiETFV8rlriHMWaV1sZOfQCWlrxM+PItoV5
	 UMqGZe+OMnnkKqPl6VLe6cZU7cdzbqt7f07Pq10BAjOXF2PgK+J85+jx3rhZpZjVzxlIx
	 l1cexXJIhPelAizKB/mhFtZxAWrFU73Y2CXCghstvQHzIzSQpEOuJF35kjBiaPCifKDK7
	 PdX44pX32cLQE4NyH4Hfhc6Bb6DpUwsUGCeAWTG+y4EdQLtToNNCR8oaOgxEWGVD07g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=ntkYRxSH;
	arc=none smtp.remote-ip=79.135.106.26
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FBF606A333
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 11:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FBF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=ntkYRxSH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795088171; x=1795347371;
	bh=D7ieWAdZhgY7+nwGt61F2fOy1JsFD+leZnNR2qOGpPg=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ntkYRxSHurOJKusUg8lESGSfF/jhqmyCjKW2+UqbZcRGBiV3+YbpPazguASkYbDni
	 dr1NLuozVTq+YOJLRRZ4ShSbCRw54xfkOayNtRl32qnjQTX+gga1cfF1RkWPg8XlsK
	 ctK2hXrZ8X75HQVSRqSMG7IvzKNW6+IHhpfQMEkZTL9HKEqv4ha2NSV5AwZbSxCZ6f
	 qxE1x5J2ALTfvoEvFB4Nj+nJcDHaZWZeyNzNTDoS0EQ4AxjALMQQ6HWijN1CNpwZ/I
	 XFTtDKbhDr6rg76nTbCD+NIAY0amGrI3mQhQM+f99tZinPG1kCEXAXu1oxpKjQvGPm
	 MzQIXHTAaBKHA==
Date: Thu, 19 Nov 2026 11:36:05 +0000
From: Yun Wang <arsenova@a7snv.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] fuse: don't wait for a sync-init mount in non-blocking reads
Message-ID: <20261116235747.60403-1-arsenova@a7snv.com>
In-Reply-To: <20261117075632.59959.p12-0-arsenova@a7snv.com>
References: <20261117075632.59959.p12-0-arsenova@a7snv.com>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: a0275a7d4c92142ff425f3f6d0461714f272f8dc
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since commit dfb84c330794 ("fuse: allow synchronous FUSE_INIT"),
fuse_get_dev() waits until the mount has installed the channel when
FUSE_DEV_IOC_SYNC_INIT was used on the device.  fuse_dev_read() and
fuse_dev_splice_read() call it before fuse_dev_do_read() looks at
O_NONBLOCK, so read(2) or splice(2) on an O_NONBLOCK sync-init device
that is not mounted yet sleeps until the mount or a signal, instead of
returning -EAGAIN.  Commit 9f6f44aa5a58 ("fuse: don't block in
fuse_get_dev() for non-sync_init case") fixed the same hang for
devices without sync init, which LTP's read_all hit with O_NONBLOCK
reads of /dev/fuse.

Add fuse_get_dev_nowait(), which returns -EAGAIN instead of waiting for
the mount, and fuse_get_dev_read(), which uses it for O_NONBLOCK files,
and call the latter from fuse_dev_read() and fuse_dev_splice_read().
fuse_get_dev() is unchanged and keeps waiting for its other callers.

A non-blocking read before the mount now gets -EAGAIN, the same as
after the mount while no request is queued.  Blocking reads still wait
for the mount.

Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
Signed-off-by: Yun Wang <arsenova@a7snv.com>
---
 fs/fuse/dev.c        | 12 ++++++++++--
 fs/fuse/fuse_dev_i.h | 14 ++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 3641abb90d..23ba4f432d 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1705,11 +1705,19 @@ struct fuse_dev *fuse_get_dev(struct file *file)
 =09return fud;
 }
=20
+/* read(2) and splice(2) of an O_NONBLOCK device don't wait for the mount =
*/
+static struct fuse_dev *fuse_get_dev_read(struct file *file)
+{
+=09if (file->f_flags & O_NONBLOCK)
+=09=09return fuse_get_dev_nowait(file);
+=09return fuse_get_dev(file);
+}
+
 static ssize_t fuse_dev_read(struct kiocb *iocb, struct iov_iter *to)
 {
 =09struct fuse_copy_state cs;
 =09struct file *file =3D iocb->ki_filp;
-=09struct fuse_dev *fud =3D fuse_get_dev(file);
+=09struct fuse_dev *fud =3D fuse_get_dev_read(file);
=20
 =09if (IS_ERR(fud))
 =09=09return PTR_ERR(fud);
@@ -1730,7 +1738,7 @@ static ssize_t fuse_dev_splice_read(struct file *in, =
loff_t *ppos,
 =09int page_nr =3D 0;
 =09struct pipe_buffer *bufs;
 =09struct fuse_copy_state cs;
-=09struct fuse_dev *fud =3D fuse_get_dev(in);
+=09struct fuse_dev *fud =3D fuse_get_dev_read(in);
=20
 =09if (IS_ERR(fud))
 =09=09return PTR_ERR(fud);
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 4b412a7622..bb7e10656a 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -367,6 +367,20 @@ static inline struct fuse_dev *__fuse_get_dev(struct f=
ile *file)
 =09return fud;
 }
=20
+/*
+ * Like fuse_get_dev(), but don't wait for the mount of a sync-init device=
:
+ * return -EAGAIN instead.
+ */
+static inline struct fuse_dev *fuse_get_dev_nowait(struct file *file)
+{
+=09struct fuse_dev *fud =3D fuse_file_to_fud(file);
+
+=09if (unlikely(!fuse_dev_chan_get(fud)))
+=09=09return ERR_PTR(fud->sync_init ? -EAGAIN : -EPERM);
+
+=09return fud;
+}
+
 void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_op=
s *ops, void *priv);
=20
 struct fuse_dev *fuse_get_dev(struct file *file);
--=20
2.56.1




