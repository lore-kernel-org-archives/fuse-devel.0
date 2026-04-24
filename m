Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC3F3246EF
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 19:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777059327; cv=pass; b=fab5Wh1896NyZQr8UadCOBH+Lrz93q23zIuROv7UJFAES1HZj5sQnQRLJSGGjB3ueTdPqpBn8iKeqM2YdcSBIfCZFmA2dBU/LOLLEhnjoX+TKFsVLGzNFKh84AnNJhhI6W/LinM/Sn5xCd+IoDUER8VhXGMzx+5fi1u46yzTtLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777059327; c=relaxed/simple;
	bh=XElxRcerJmnCKIblVnqHS44guv+hwYgsYsWQaeadyj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQyYhnmwgS9agS5IQxswIpRVWjW1MA4EKzRDXLYFmyyvSPxMwng7N3doxUUzs/Ru1p4wLFyOtgcTsdLORJyvJNO50zKSagbRoPOHW6xIbB4r8SST13P0hSF7wn3g6GVW+MqQj7o+v1l8BfxoaAmb80oqrWjQHKS9u5d6R64mLxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWHnnrH+; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWHnnrH+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d73422431so7209951f8f.2
        for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 12:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777059324; cv=none;
        d=google.com; s=arc-20240605;
        b=AnI9QFbPjWun+oCXxKS4iGCZLx7Er/YpIW0wFDFIT4wCH3c64AZbb2q5YIoTRahMjO
         xC3B6dkrjXFM/1K2vLIqhD6idZ0tkVzMcIzePrPo6P+wnmojFWwRq/mriIwIDiq5xw+E
         aAld9OxDKBiXC7RgpsBPcYiF86Yhfk0jNGsoBFdM2uqe/0KO2LmoaCxWJ5bDoHn1Kq4Z
         lmvF3F7h4LpN1q1GC8xZiVLeEuPeT9jejBVobaXFVN2YwtzXCaBrb3jLlNQSK3FFaKMC
         L4wgEoHbiC8XYF5cOL/nVoImzM8CQm1KOO75DqUChs3MIaVoLjG3G/Y0etyx8cJkkUo9
         an2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yxEqdpB/RW+s8Eu203oUw9sq4uNdIu3N2g0iYn9nQ8c=;
        fh=YVtB5oLBAT/RK4+U9g7AG6e2Oc4Y+M++CbCiAkEZ3kI=;
        b=NP5JdB/suKfATlgYci8rcBUJa0wjvyla8wQaGGfQYYB6o1Sca6wgNlHwSTxNKUQhHv
         zBmtoefKm24ynpKCb53wDczF6J83TruLw6WJ8Hh17gDFESwS6NVAgEubbndPr3P91uvq
         6KaBmHurluuE1UededqdoaEyXWGDeoC7o0uYiDZWpysqxj1EOikH2aV4q97usuBK7B8n
         KpTqsRJl+GqOAe96x5kV7JP/wRiJXfTCmni0KEUtIKGWILx9LkWS0HdT6aPtfxy7jlH+
         yaApqGeqt4E1WWXSPoimetCFjAfFnoVDpVFQOVaFDvNBz1jUGDcPLPAzPD1Nz1/LaONU
         t+xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777059324; x=1777664124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxEqdpB/RW+s8Eu203oUw9sq4uNdIu3N2g0iYn9nQ8c=;
        b=lWHnnrH+d9xZBU2Gp3pZFE0bYLrzHZpH1542OY2sWQzikuZH9vpFdE7PR5GdJTY8wb
         toMW5BocAJMrWz0NPD8S1gVSQJQYtbdaGo+34pezW64iqjvPY1PHTA0HfSzSl4Lr0BQk
         kTumruHyfXjcVCt/OMTg0lvvb6J9Sx8P92DJUviU26QNcJZlthIwfoSt3O6sF9FjTm9N
         Xec4Yag4+92s5V1XTQ/BL3bjfd4mXMVhm1+lfZbyDe0igl33Gd53D7BmGTK461gqIV76
         uwaRgoDw8XNVhy6l2cHv5YHOSkaQCQz+4qWzxQjxIt2T8gf7/cAvcsqX1vPees9wpjpb
         UGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777059324; x=1777664124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yxEqdpB/RW+s8Eu203oUw9sq4uNdIu3N2g0iYn9nQ8c=;
        b=k8N6bfM4sHR76XNJ1zjUjvU+8qKKI8KIjhCoCsFLTizJN8dpk0bwE2N04TGrOIj844
         cEjty0ZUAR09LKleqbdK3SMB5OpZ1PslUL7UMBxkho6yHCwV6w3l3enJF12f87QOlGHs
         sUSE8VfOSFVeKZAKrElDPvZdvykFkooplLU7DxGNgNYzVcgXNdZFp0pqcHnm/FDhAHKc
         fNTOXuJQdYzBQGtb70H9emBpDBiQYaM647lvAmnQUU00XwMp8PaYZLHDQCjv43W6/pcW
         hsN/OA70BRXyiqSzSignSQHhwHWcRMHS3VyoaxY+m7xGvQTR7V3f3Edj1xBUSLRK6Xme
         KCmQ==
X-Forwarded-Encrypted: i=1; AFNElJ97Bpq+oV17oCmWfkBtDVq4EGAUliPMVjdxmJioi2Rlwxv60GhJfVc9/rCnKMNNTfsF5xiBVXmBZzKr@lists.linux.dev
X-Gm-Message-State: AOJu0YwIUO6MQSADG4BJhryW8nyDO0Es1yp+fUqaIsnCEcU2Y9vluIAF
	VOPKjhj5qWoKC5FHoaOIv1wg4pVw/oY8updTmWIVNqBzPBPYyE746YvZmFkZLo2WTtmJiHaspHe
	Cqbp1G6A8KmUSI/7giJ0Za3rS3Xs2Pco=
X-Gm-Gg: AeBDievPdfU68nAo6zFepMaN1XgwtKXTkZ3cbANnKfTLlXoaZuTcWUiFxH9UZy+1CjO
	OoHGaP3j1+5VF4CafEgAnvmsMJs7RsXHdVMsN6n2ZIjAdTY9guJwYs+kY57irf+0Z2swBGYlopm
	HV6v3b62eyJYW+tu8ngwND5mSeBPWmtxMP0Iy4xzfHLuK2CEraMHRBCKb+XSPDSgsrC5L1Ip0LA
	pvFcqGFz//Z27tRUGP7Hgq4mFxyT+4C0NoAd86/bBsvzsXYFa7YQYB07gH5eRcJyk/46yK3MJ0T
	QJcAb4F9wneaVX8DtManY91G/Yr5IYbHft4FlPfo+741
X-Received: by 2002:a05:6000:22c3:b0:43c:cf25:f29a with SMTP id
 ffacd0b85a97d-43fe3dc819amr52741755f8f.8.1777059323757; Fri, 24 Apr 2026
 12:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424134935.16161-1-luis@igalia.com>
In-Reply-To: <20260424134935.16161-1-luis@igalia.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Apr 2026 12:35:11 -0700
X-Gm-Features: AQROBzCQ83cKY4X4yuJlNSKnj6BsTQpURZVqjwRIosP6JkzbGG96ZJHWvJ1Jq8w
Message-ID: <CAJnrk1bv4NK7MF4msYMAmbS=+vL=k8NLoLiNyM4QB+amccpOww@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix race between inode/dentry invalidation and readdir
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 6:53=E2=80=AFAM Luis Henriques <luis@igalia.com> wr=
ote:
>
> When there's a readdir in progress, doing a FUSE_NOTIFY_INVAL_{INODE,ENTR=
Y}
> on an inode or dentry may result in stale directory info being cached.  T=
his
> is because the invalidation does not reset the readdir cache.
>
> This patch fixes this issue by adding a call to fuse_rdc_reset() (modifie=
d
> to include the required locking) to these two operations, allowing the
> readdir cache to be invalidated while it's being filled-in.

Hi Luis,

Just curious, are you hitting this issue in practice or is this mostly
theoretical?

afaict for fuse_notify_inval_entry(), it calls into
fuse_reverse_inval_entry() -> fuse_dir_changed(parent), which calls
inode_maybe_inc_iversion(). afaict, this actually increments i_version
(since I_VERSION_QUERIED flag was set when the cache's iversion was
initialized with inode_query_iversion() in fuse_readdir_cached()),
which means the next readdir call will detect this version change and
call fuse_rdc_reset() (in fuse_readdir_cached()). I'm not sure I see
how this leads to stale directory info lingering in the cache after a
concurrent fuse_notify_inval_entry()?

For teh fuse_notify_inval_inode() case, which I'm assuming is the case
you're running into where the directory is the inode being
invalidated, I see the call to fuse_reverse_inval_inode() which calls
invalidate_inode_pages2_range() if the offset was non-negative, which
will invalidate the readdir cache's pages, which means on the next
readdir call, will already call fuse_rdc_reset() when it detects the
missing page in the cache (in fuse_readdir_cached()). So I'm not
really seeing how this can happen either for the
fuse_notify_inval_inode() case? Unless you are passing a negative
offset, but as I understand it, passing a negative offset is used only
if the server wants attributes invalidated [1], not any data.

afaics, the onlyy stale directory info returned would be for the case
for a concurrent readdir that has already passed the pos =3D=3D 0
iversion/mtime check when the invalidation arrives, but that seems
like a server synchronization issue, eg if the server wants uptodate
data when doing a concurrent readdir and invalidation, they have to
order that themselves. ANy fresh lookup after that though, I think
wouldalways return fresh/non-stale data for the reasons mentioned
above.

Does this align with what you're seeing in the code or am I missing
something here?

>
> Assisted-by: Claude:claude-opus-4-5
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  fs/fuse/dir.c     |  5 +++--
>  fs/fuse/fuse_i.h  | 13 +++++++++++++
>  fs/fuse/inode.c   |  1 +
>  fs/fuse/readdir.c |  6 +++---
>  4 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 7ac6b232ef12..6e5851de3613 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1615,6 +1615,7 @@ int fuse_reverse_inval_entry(struct fuse_conn *fc, =
u64 parent_nodeid,
>         if (!(flags & FUSE_EXPIRE_ONLY))
>                 d_invalidate(entry);
>         fuse_invalidate_entry_cache(entry);
> +       fuse_rdc_reset(entry->d_inode);

Hmm... I think this resets the child's readdir cache but it's the
parent's readdir cache that would have to be invalidated, so would
this have to be fuse_rdc_reset(parent)?

Thanks,
Joanne

[1] https://libfuse.github.io/doxygen/fuse__lowlevel_8h.html#a9cb974af97452=
94ff446d11cba2422f1

>
>         if (child_nodeid !=3D 0) {
>                 inode_lock(d_inode(entry));
> @@ -1637,7 +1638,7 @@ int fuse_reverse_inval_entry(struct fuse_conn *fc, =
u64 parent_nodeid,
>                 dont_mount(entry);
>                 clear_nlink(d_inode(entry));
>                 err =3D 0;
> - badentry:
> +badentry:
>                 inode_unlock(d_inode(entry));
>                 if (!err)
>                         d_delete(entry);
