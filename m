Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F0F58F07C
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066279; cv=pass; b=RvoJdKrTHXL1fFJeFlxntIzFpi3AhiHMWjNO24oAOBnctGupAT0U/xnz4csfdC1XFkWurvdjXd2Xj3n5s0FtsqEcwTvdgmM6sV1cDmVhOJwvKyUovObAsmgz1v+yCwe2I1nzYwCjIpRkzMH/0i+DjYmXpa93SvV70mgI54OPBo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066279; c=relaxed/simple;
	bh=E8ECUTSxkYxtjfffY1EweDG3Ov8lBYCUxzc2AoG7F7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKrW1WMbULe/nkljXvcpUgEkvYM0XK33iD+zyhvnMckNtU8s5Ut2MhShjWorCyjzhnZjS5cd2o2Nw9azxqZOr7xZjMBAXNs3s3w8EU2zQwxeUYFVYCYqJLfxWuvWpmhEjNHM34HyaFx4waIHpQEC14yUit/y/vXoZlKq4a4gGwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTynJael; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTynJael"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso15855766b.3
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 11:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066263; cv=none;
        d=google.com; s=arc-20260327;
        b=G/yXvHeQrMyeKelaJTXdhgPGkYhVul1AQWOBROqUKcW5PE7QCufUMcSKWwG5QoRbKZ
         iOac+N48nqn9hWFNySMsvKZaiVSsw0GOuXTGWLtqi0s9aArrFEDLUMNPIymprByOYz/U
         SyU7OijRfn1WlwWUeEB33sTsO83wiBIymcOZsbxOAkZ7p3/z2RZ/j/E4S1dRqZz1+Erb
         9nc4wUfZW6JwiCbEpyXdj7Cc1ac2j2yC9Pd6h2oVyo/y/9RSTf4+9px7gysSglzBl3cx
         2Pm/bxsZYdYurETwnoaWeRRoSOflaH/ITruxcXNOcJ9OMZBJx7KbtRPKoLE4gSGVtOwj
         erZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GHbrPCsfNB2NLhSOQejnkC4BucMxa/AsAEAIxOLb+IA=;
        fh=e33+Iyg2soAKkUZPyueVMIhDQpXmu59yetQ6tYtiSSs=;
        b=AJMojGvNuyWs7xLoztu/1OtAIkDVsiovcjsybFzWL+Kxy4yf+iVrLMdrTRXE//Tivn
         /NcUPgO+38JxdHo03HrZdbTSfOJfLVStR5ppBY0ctNMm0OWLkb5WEjyYbUO4xp00hdab
         2TF4HkvmLK4GoRAh0CazOOL9BbMFdnCrrNoZZtNlXB9TTbQP97nGYBvGvCVGb0WjNGrn
         GRjFFHdUyimPT19UUvfj/VM06yPOT+Hx1fdxQ5ahcYWuMvbYRbm/0CXx6EiAMS69nUzl
         jDe/AANk52Mn7PXPodl3oc01A4OaIpbyisA8oC/LNkg3Lf1M7IDdbmPhkhzpHcWB5pqc
         2aOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066263; x=1789671063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GHbrPCsfNB2NLhSOQejnkC4BucMxa/AsAEAIxOLb+IA=;
        b=cTynJael/nFQ3w7cdIY9caLWHoQ3pTxyE5a+cK1yfDdNPPweGMmPEx8w0KrPdvL+Fe
         LYyc7AurPajYVXDXxWJlvFGG+7eWse6IXPlXSKXMPW/04C2n/W61c3sIFM0MA1Rr6LHO
         EjKOz4nQBoCtG2zrRoPkdzf+WlvMWv6Y1HGBey/4x4XeTFP0iSWf18nSPOHidRwhHZCI
         vY0hXc5tJ0gaz0BZocFbNLne3uGPhaFY9KcS/qaBxvMEJw+7ChBERVfb+O58PQyYkaAS
         LzgiKqv1RYkW0l6pmjxTUcIWpYMzD0UDS3UQSLKZ6Vvd+LugV10D/OSaGz+Cyzf3pUyC
         cXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066263; x=1789671063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHbrPCsfNB2NLhSOQejnkC4BucMxa/AsAEAIxOLb+IA=;
        b=WeuCxJc1gS7wm4V9jjbRjLGI/mod+ALDhF8juNuZzndhNGjQsGu3QDiu2DacfeyKaR
         zbgBR6fzSkZMJX8jaMTof9uIrzt4G473Q7Wy63NG+Kft/1j2qnKLDqq8n6BgzNhm2Wwq
         9EYMMWU9ZO32rjD3ruVTYLxNz7aLxEx2eL224ombTIior5riKwqCdepv9YOwpEJfOgrX
         oEXg3QSDEYKTkKEyZBOaBxH6omHhn4wmsmSRiON081VtzmBuEAokYQQIq1LRD0h0RJAR
         U5aeXtyGmcvp+VpmeyrZGCGB4z2wdF16lJD/UA3vNKM382gshCO1sP2Klf0PdUZa1Rl8
         kdbw==
X-Forwarded-Encrypted: i=1; AKwUvBwRRClQQxwl15Ug9tesBLrWAOZhkWkKqg7akrPmJpZg8SnUw1V0CLwx2lFLsrQYkyDC/LlSX5UNihta@lists.linux.dev
X-Gm-Message-State: AFuF++kjdcXhF3VikgNKRT6GQIvC5L364vQUGhUbDiRFlnLne6bRtx5O
	6BA3AAfALnjbZly7UN9LcYS4S/jzYDzOaU7+8yE5rOENYIoLGC7JN8tATFIaCf38irsOKgSJGI2
	x9eMbmWoCeaBzRxTrP6L46p2098eP5Nc=
X-Gm-Gg: AYBFou3F8udkMc3OsXD05tO60mJF6LkbFFkOlDIXNdgxSBzggoSmzqvXAMNxxtZ+Cxc
	/rde55gW2rySUIAOgOariPoNmWMjVaOwgpRhQYHSejN/OCDtsMdF8E1CJhw261RQIBPydwVylGU
	3E72DSGXXkjF1bPsv036SE29nwPiy6fcb+dXuMgjU4iL46xPEcdoaDdWjzZhFFGxGs+Zf6c9+lz
	auIwJgitVw8d8+AWl7YFUquSNd6SyQaxatGGXSm2ACvtT9EhllS3H1LhTHLkA+DoC+gHysVK8uS
	gABjwz9+jJEdXZLzcItT9UvhD057b0uJITbEzbAs4YmJ3CsU6p3eM3FIFpnl+QwLN3eU
X-Received: by 2002:a17:907:7203:b0:c12:5a0e:3e0 with SMTP id
 a640c23a62f3a-c29665586bdmr1293366b.19.1789066263344; Thu, 10 Sep 2026
 11:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com> <20260910184424.156341-1-shayba@google.com>
In-Reply-To: <20260910184424.156341-1-shayba@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 10 Sep 2026 20:50:51 +0200
X-Gm-Features: AcwNN1XzPl6sCfEfyGDUtYT_TA2joRNYoLDO4R22DRWhcKPdZPzJ_hcvSfmgiWQ
Message-ID: <CAOQ4uxigJO7Zi2U7WRJh9UNs5-WYDv5wHrZxohSJJOp6_j1=7Q@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Forward vfs_fadvise to backing_file in
 passthrough mode
To: Shai Barack <shayba@google.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Sandeep Dhavale <dhavale@google.com>, Akilesh Kailash <akailash@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 8:44=E2=80=AFPM Shai Barack <shayba@google.com> wro=
te:
>
> When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
> other fadvise advice on a FUSE passthrough file descriptor, the VFS
> currently only executes generic_fadvise() on the upper FUSE inode
> mapping.
>
> Because FUSE passthrough does not forward fadvise operations to the
> underlying backing file, pages residing in the lower filesystem's
> pagecache remain resident in memory.
>
> During media-heavy workloads (such as image thumbnail generation or
> streaming), single-access file data accumulates in the inactive pagecache
> of the lower filesystem. Under memory pressure, the kernel retains these
> stale media pages and instead evicts active executable pages from
> running processes, leading to severe direct reclaim latency spikes.
>
> Architecturally, Linux VFS supports filesystem-specific fadvise
> delegation via the .fadvise hook in struct file_operations. Implement
> fuse_file_fadvise() in fs/fuse/file.c and register it in
> fuse_file_operations. When passthrough is active on a fuse_file,
> fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> to cleanly invalidate the physical backing filesystem pagecache.
>
> Signed-off-by: Shai Barack <shayba@google.com>
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Cc: Bernd Schubert <bschubert@ddn.com>
> Cc: Sandeep Dhavale <dhavale@google.com>
> Cc: Akilesh Kailash <akailash@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: fuse-devel@lists.linux.dev
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> ---
> v2:
> - Remove redundant !backing_file check in fuse_passthrough_fadvise() (Ami=
r Goldstein)
> - Remove unused fuse_passthrough_fadvise() stub under #ifndef CONFIG_FUSE=
_PASSTHROUGH (Amir Goldstein)
> - Reorder fuse_passthrough_fadvise() above fuse_passthrough_open() alongs=
ide other passthrough ops (Amir Goldstein)
> - Add fuse-devel@lists.linux.dev to CC list (Amir Goldstein, TJ Mercier)
>
>  fs/fuse/file.c        | 11 +++++++++++
>  fs/fuse/fuse_i.h      |  1 +
>  fs/fuse/passthrough.c | 13 +++++++++++++
>  3 files changed, 25 insertions(+)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index a4d736945..81709ab82 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -3537,6 +3537,16 @@ static ssize_t fuse_copy_file_range(struct file *s=
rc_file, loff_t src_off,
>         return ret;
>  }
>
> +static int fuse_file_fadvise(struct file *file, loff_t offset, loff_t le=
n, int advice)
> +{
> +       struct fuse_file *ff =3D file->private_data;
> +
> +       if (fuse_file_passthrough(ff))
> +               return fuse_passthrough_fadvise(ff, offset, len, advice);
> +
> +       return generic_fadvise(file, offset, len, advice);
> +}
> +
>  static const struct file_operations fuse_file_operations =3D {
>         .llseek         =3D fuse_file_llseek,
>         .read_iter      =3D fuse_file_read_iter,
> @@ -3557,6 +3567,7 @@ static const struct file_operations fuse_file_opera=
tions =3D {
>         .fallocate      =3D fuse_file_fallocate,
>         .copy_file_range =3D fuse_copy_file_range,
>         .fop_flags      =3D FOP_DONTCACHE,
> +       .fadvise        =3D fuse_file_fadvise,
>  };
>
>  static const struct address_space_operations fuse_file_aops  =3D {
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 939553b34..6c60716e7 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1581,6 +1581,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_i=
node_info *pipe,
>                                       struct file *out, loff_t *ppos,
>                                       size_t len, unsigned int flags);
>  ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *=
vma);
> +int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t=
 len, int advice);
>
>  /* backing.c */
>
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index 059e57969..8a8fa6b8c 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -160,6 +160,19 @@ ssize_t fuse_passthrough_mmap(struct file *file, str=
uct vm_area_struct *vma)
>         return backing_file_mmap(backing_file, vma, &ctx);
>  }
>
> +int fuse_passthrough_fadvise(struct fuse_file *ff, loff_t offset, loff_t=
 len, int advice)
> +{
> +       struct file *backing_file =3D fuse_file_passthrough(ff);
> +       const struct cred *old_cred;
> +       int ret;
> +
> +       old_cred =3D override_creds(ff->cred);
> +       ret =3D vfs_fadvise(backing_file, offset, len, advice);
> +       revert_creds(old_cred);
> +
> +       return ret;
> +}
> +
>  struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
>  {
>         if (fb && refcount_inc_not_zero(&fb->count))
> --
> 2.43.0
