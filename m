Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC75214A9B
	for <fuse-devel@lists.linux.dev>; Wed, 14 Oct 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970657; cv=none; b=OgFmYtqQmXco/0CzgKtN+kxT7p5xj9X9eszg10j0BaEF/QV3muuANqb9Ay+vE3t9H7yLwvURfOcSgnCGwFv8tHpDSg5/1BpFxaPiv7dq0zhV/owLTgmAKULIA36yUuM3VdSwegwZ+F0hZ7Dykoz6gi7TWq3ERg67r+5M0pkmRKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970657; c=relaxed/simple;
	bh=2JqF29mdIDBiDoEAPp3FTW8LA4BFk/t8vIBM6YPijak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKdWrXpE3bxMBXxkevxIms7Bun68bZQtvhCFtNJTDT0Kv9Nxy5HNtMyh5vKjJctjTyYE+M6hoeeB89Lxz7DOp1Madt/uXugsng9shRQ2VEMYsfYCrgMMXsa1b1q07hg+zUGxRUMIj3ffczSH43SMZf8UkcyNqhJHwFJr/BaMqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRoTlTlO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRoTlTlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791970655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DZHWlhTDhL5WqiNRs5JbrYvHrkANNCynzraFMjRCOYs=;
	b=PRoTlTlO7Ujl99t2HWs4AD9wMoGhiK7dF9n8xAoz5HijljibqxUSMzFk4R11HrmM/A2vfy
	pBbmioW7AHMkJPpOuw0MsPDULQWl2mfHgJqlupl0sxqwQoDveu+7TonJbEiHPIN2lNUM+x
	KEZQSv5ZKIHnLdeujb0WwbwfE+0Kw1w=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-5OfMOgS9Nq6UdWvC2G6eNg-1; Wed, 14 Oct 2026 09:37:34 +0000
X-MC-Unique: 5OfMOgS9Nq6UdWvC2G6eNg-1
X-Mimecast-MFC-AGG-ID: 5OfMOgS9Nq6UdWvC2G6eNg_1791970653
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67901cb4b08so6062065d50.3
        for <fuse-devel@lists.linux.dev>; Wed, 14 Oct 2026 02:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970653; x=1792575453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZHWlhTDhL5WqiNRs5JbrYvHrkANNCynzraFMjRCOYs=;
        b=OaIXKYe39jIgNtHlI236Z5d6GpnUNYTKw6F2grhbMylAojyXOpu80wnVIH2DWFE9Hc
         eJB9TkTy+vPXqtpvrhU0hvF4sdlbjH8FprmXq6NrKRntMGgn/P72R2DPS4Pf45uXqfGH
         A6JBxK7+sSSVbeOCE0khvo+9kvoTkVINtukk6wnA3/7s43PYeHPYWjm33219q4pjkLjI
         CGDTTTlElJzFEETVlMH6C+oyNbQjH19CUGFZ3fA1zpSdI5g0zO8aYWPeQ5uk19qEzXeW
         fqvqNe+yyC77nn9Qay0fwrXi5+xiigvHMhKW3zQC9KBqF7wY81ZeR+3V+puXwOFVocx0
         Ebhw==
X-Forwarded-Encrypted: i=1; AKwUvBwix1/6oJwzg8DGMjki418K4hBg5ekwQ529sRWI0pCw0DF3di38sbOOsuAw6RGOU0IqskxW9squaC1V@lists.linux.dev
X-Gm-Message-State: AFq9FYLD0aIwMzMDYczAzFNqXA6lt+3qBDVfv6yf8uyiG5Ja7orjSNl7
	d5muVL4tSGxH1qow9PLc1A8fuqMQ/082Wfk2c/FfRHV8DLR7BWApaNQlddIep7pzEAJF5T0ueat
	pFdxwkfLJajGL6KEraYiRKmd4hwCf0VUFxqkH7wRtl/PmB0onJ2AeXY9tDvcJRHqVULnJmQU8S5
	D4TzLqTOScfESvqiUEorkIN2ItbKyNer4uqeEgkQ==
X-Gm-Gg: AYBFou20dKoaOOAcumClez8mrsJlysVKVKufP7+ZHDppX2E/PBpG9SfcEgrxzOm64Xd
	yQd5wfwy1KXa7nOXoW1IiQKCuaqTV+rlCeugg7IJhRJZKz84kuZ3jIwKcMRZQNbdt2OPq0UJR0s
	83Pm1UiBQ7zjng3MdU23a5lsT4o3KZ7MpzyEAiNnUqNOrSENyTi0YR
X-Received: by 2002:a05:690e:bcb:b0:679:8e30:440e with SMTP id 956f58d0204a3-6798e304456mr345318d50.158.1791970653440;
        Wed, 14 Oct 2026 02:37:33 -0700 (PDT)
X-Received: by 2002:a05:690e:bcb:b0:679:8e30:440e with SMTP id
 956f58d0204a3-6798e304456mr345307d50.158.1791970652857; Wed, 14 Oct 2026
 02:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008112004.1899560-1-mszeredi@redhat.com> <20261008112004.1899560-9-mszeredi@redhat.com>
 <sashiko-outbox-164097@kernel.org>
In-Reply-To: <sashiko-outbox-164097@kernel.org>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 14 Oct 2026 11:37:22 +0200
X-Gm-Features: AclHuK9oudbuDKSUqa_bJ75j7x9Hwi3mgbzizDj7pqL1HcfMX3cGRTRtlrqqQvI
Message-ID: <CAOssrKd-ACNEo8uOddmyCaGBsF-GYTNsnOq8PML991Gqq0E4Ag@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] fuse: add extent map I/O support
To: John Groves <john@groves.net>
Cc: sashiko-reviews@lists.linux.dev, fuse-devel@lists.linux.dev, 
	Amir Goldstein <amir73il@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, linux-cxl@vger.kernel.org, 
	nvdimm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ylYNgWA4LwGl5bWevo3h-zM5NDt7U_aq3NdUTh0WyeQ_1791970653
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 1:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index b5bef7b9e466e..77d7a54066e47 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -551,6 +551,17 @@ static int fuse_fsync(struct file *file, loff_t st=
art, loff_t end,
> >       if (fuse_is_bad(inode))
> >               return -EIO;
> >
> > +     if (IS_DAX(inode) && !fuse_inode_vdax(inode)) {
> > +             /*
> > +              * Note: the DAX fault path calls this via dax_finish_syn=
c_fault()
> > +              * and taking inode lock in that context is prohibited.
> > +              *
> > +              * FIXME: need to flush CPU caches for the DAX memory ran=
ge
> > +              * FIXME: need to sync metadata to the server
> > +              */
> > +             return 0;
>
> [Severity: High]
> Can this cause silent data loss on fsync() for DAX extent-mapped files?
>
> When an application calls fsync() on a FUSE DAX extent-mapped file, this
> bypasses flushing the CPU caches for the DAX memory range or syncing meta=
data
> to the server, while still returning 0 (success).
>
> Because the operation falsely reports success, applications relying on fs=
ync()
> or MAP_SYNC (via dax_finish_sync_fault()) to ensure data durability will =
not
> take fallback actions. Could this lead to silent data loss on a power fai=
lure
> or crash?

John, what's up with CPU caches on mapped writes?

Thanks,
Miklos

