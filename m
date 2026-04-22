Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC61A6815
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842844; cv=pass; b=ZNJ8CyzzXCd74sVFSJ7DJCm5HDwisaLmcjYRQgdaiDlWxLgkbnyKzZuH93cvNTrVoQdGsdmHGtvwLkONclCRKaKDTCG/TEaMfuRqmITvylGXdCfKklOOYss/JKOba6YOwIuXSPkCPXwQfBT+Pg7KqqwIKlzQvECiQ/TQOPdwTUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842844; c=relaxed/simple;
	bh=HjPW88b11TYOFDMa3YpRBAM9AvruUprBac8Ym18GkIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1dsxZlbkfGffd18V++NuW+w+tryJk94lEZcADczTKpFN09166rd3RdOtSJ9WEeOQOxb4Qzu/2mcsdCSHPvKfmShUfBNINocEnuUAqiZfR9sltMSNqcYWS7m6ALHEBSVn5X7DYwkGH4Emi/B0OzqHnADtx8+G69ovcAxl+JY3WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnstgaYL; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnstgaYL"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9382e59c0eso813214266b.0
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 00:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776842841; cv=none;
        d=google.com; s=arc-20240605;
        b=XIUoMf3B/Vdz4UaHqviu4BeRBwqFfqhR06at4bKH33Ft8S0T5mNgbs5lq1nMcgDLuS
         SZ1Y06tFgtFWU0KlhKrmzvI6AKayvGunupdqp6hjf2cdjWUCYM9irnSKTVCFjHdMcxfi
         wTafw57FwF9FqIQTTA6oSTTrlDv8B4bVdXtQTRgJwll0pKnTlXuHmaejlhzOqBJb/z1J
         aZCoXqXiWxrJB/WZ2FzHQVevzySP7jn4h0SNp4+UW/w90bThlEoEpMYzLCXUqIlt6pfM
         eg0aEZHB6Nad5TI3F1bYD9OCPPOCSANdAx9F0GnLUoc4KyFXJ06PePqphV8T/PLR37ON
         GpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fYVI6Q3hX29XgKQxVZi2u1W2uZ5+Dw4N06UswbcohcQ=;
        fh=6QtI8I9uUnmNMOvmI6L/1GnlYM3evuXX0q4rs5V7iDE=;
        b=TWQd/aqjpTRkIiHri+5L2WCF1OzrcxO9FHUiHU7BSVXspAiZfl/xoJCswrI1Dpja3J
         aHPcf4m7CkBh5WvIYV9iAKqm6U05FwNp0c0M/OfGRJZRDTQk3PBjGPtvsgzsrnvmSuPG
         PBzc5khqaQUSBwLmywN3BevMhGu3vUwj71AkoL7GVWDVp+B9x0eTcHo5+4oApARSPQk7
         aj0wDRmoq3VoJjEb+b1lvPKqDguoUyUP82ARdSGsoLPMJR0fIiax4gamMG69I9wOIc/L
         DMuvobXsLcnvyVc/1Xc+WanIZU1cIax5JonsA8RnSFADUf7Wr828IpIuMTrloHdux1lu
         Rp8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776842841; x=1777447641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYVI6Q3hX29XgKQxVZi2u1W2uZ5+Dw4N06UswbcohcQ=;
        b=HnstgaYLGiJUbWJeKgccY7lmwdHuAfHTiF8Tc2i7loa/mlGW02xhkGGThHsfY8YzGg
         O5QLN52tE9ZbKffmrKc1XqS3zGH+CEHTYfCdYeFLmpsgsqNtuRHqU1tQ/+JdLyDm6k/T
         JYTv+MXp+GpGKrjgHA9DYRzb0vlPznBfXPPpTquiyL9kjTeHZCJdXlXwQgkNvhxthosV
         u/K52sh2Vnj8VMLoP7B1LFm/HB9fcdfACYj2Bnuv4LOLgQiM5ye5FQlmrnqwj5nQH0jY
         v3tFUPDqcrJlg8Ptggs3sNyGRDqK783RuphQTzf2f0nfBs0PEspDfLrtrvKv+5r7gLV1
         sacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842841; x=1777447641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYVI6Q3hX29XgKQxVZi2u1W2uZ5+Dw4N06UswbcohcQ=;
        b=SYWZQp2Bk4wjpiVERbB6P0cS7Ev//jlRVkGxngdeGPadzrybI2OlRanMyYVngHN+jV
         1bCqXMXWmB81uGilBmxRza5WqDAUlLjnRRIbK65K6VY19kISqYnDnyJHdwKNSUArJUj8
         9t4nQ1T2hop1oiRLchO7vDf5kfAYMT3ZsNa6zwrO5i2V5+lKRu9tx3lUnlCBjzC8d3mv
         N8IK+ZrBSZRX371zl2Ra7nKL13KTUmwD6Sf7Q2hjAu/kgHqqgU2/O/pt116G4LhUZRrj
         gXKIS5CsAhI+OfCzGYK6kbO8tS/iunn9NvswDYhGWUD0ifogEI9issAL0u7TkUliB3jw
         tkUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zWwqYofzhYDzpwAVTF+js2lmxmb7iF5EBPq3IOgzp1In9l0abW9Fautcts+3Hy/EEvDSSUL6/DlbT@lists.linux.dev
X-Gm-Message-State: AOJu0YxR/ZFYt2KwGNzcNuItM+A5jHcTW3Vg63yp0AAFTJuj0Iit7tio
	YFocao3uMM9PtBhszmFelMUtkcWsvXPlWjQEjbfeVMB9O84xKZaoDfRWzt3yB5WOnuV9mlRuaiI
	FG11hSI1qI4hTxpOmlcwULXbKusMXXiY=
X-Gm-Gg: AeBDietQCCWLl7qtGIwOmGhD7+ycPqFbRY3hFIjwjf1lA8fnVpuGgArMFYXOSo+27Oy
	2f3jVlzukV7YRLtVHCDnQkt8AbT7T2UfBvgPu7rGDT47o8HOFpWJNSHwp/3Mll02WjSZzf9qCmp
	Kzyp4vUKwFTPfW6vB9R3Bqd3cQORlpF+ZjHnRLhh8UUEc3lpYC1p7VXlxyoDbJJa5xcvfNx4753
	9M75sU2t81mR5/N2yrkHMQ23BzmGMNR/lDSCry8FkGaCdD82apoHYkOAvvqel+KBeId4CMI0g1y
	Ws76jUU2tf4CTM4GrsNqwxZOFBT4CSmQBbIlBKWt2AudLlXZxmQM
X-Received: by 2002:a17:906:6a19:b0:ba7:7f6d:be4a with SMTP id
 a640c23a62f3a-ba77f6dcc54mr702555166b.26.1776842840385; Wed, 22 Apr 2026
 00:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-9-joannelkoong@gmail.com> <CAOQ4uxh0E6BtxRVsJdvebybnvU5+n-bur-+SPySNAbKzdY59vw@mail.gmail.com>
 <CAJnrk1YWpAZR5bck27s2P-Zm1s9O0VMMHNztEOMYutVgQ=CwGQ@mail.gmail.com>
In-Reply-To: <CAJnrk1YWpAZR5bck27s2P-Zm1s9O0VMMHNztEOMYutVgQ=CwGQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Apr 2026 09:27:07 +0200
X-Gm-Features: AQROBzDInU6xUvd2MgrlBcv0UIhpySQoTlTu04KC8eKHTLW9BYioudyYYlrWipg
Message-ID: <CAOQ4uxhVPCp2r9MehO1o6L1J0J3WwGt_iK23-0hWpw+8osmKhw@mail.gmail.com>
Subject: Re: [PATCH v1 08/17] fuse: add passthrough ops gating
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 4:57=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 3:48=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gma=
il.com> wrote:
> > >
> > > Route existing callers through a passthrough ops mask check to verify
> > > whether passthrough can be called for the operation or not. The check=
 is
> > > only done when FUSE_PASSTHROUGH_INO mode is enabled, which preserves
> > > backwards compatibility with prior passthrough behavior.
> > >
> > > It is safe to get the backing file by accessing ff->passthrough direc=
tly
> > > in passthrough.c because passthrough.c is only compiled with
> > > CONFIG_FUSE_PASSTHROUGH=3Dy and the caller has already done the ops c=
heck.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > >  fs/fuse/file.c        | 14 ++++++++------
> > >  fs/fuse/fuse_i.h      | 14 +++++++++++++-
> > >  fs/fuse/passthrough.c | 12 ++++++------
> > >  fs/fuse/readdir.c     |  2 +-
> > >  4 files changed, 28 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> > > index a15fb508fd28..45d9184d0f7a 100644
> > > --- a/fs/fuse/fuse_i.h
> > > +++ b/fs/fuse/fuse_i.h
> > > @@ -1630,9 +1630,21 @@ static inline struct fuse_backing *fuse_inode_=
backing_set(struct fuse_inode *fi,
> > >  struct fuse_backing *fuse_passthrough_open(struct file *file, int ba=
cking_id);
> > >  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_back=
ing *fb);
> > >
> > > -static inline struct file *fuse_file_passthrough(struct fuse_file *f=
f)
> > > +static inline struct file *fuse_file_passthrough(struct inode *inode=
,
> > > +                                                struct fuse_file *ff=
,
> > > +                                                u64 passthrough_ops)
> > >  {
> > >  #ifdef CONFIG_FUSE_PASSTHROUGH
> > > +       if (!ff->passthrough)
> > > +               return NULL;
> > > +
> > > +       if (ff->fm->fc->passthrough_ino && passthrough_ops) {
> > > +               struct fuse_backing *fb =3D fuse_inode_backing(get_fu=
se_inode(inode));
> > > +
> > > +               if (!fb || (fb->ops_mask & passthrough_ops) !=3D pass=
through_ops)
> > > +                       return NULL;
> > > +       }
> > > +
> > >         return ff->passthrough;
> > >  #else
> > >         return NULL;
> >
> >
> > Please document the relationship between  FOPEN_PASSTHROUGH
> > and FUSE_PASSTHROUGH_RW_OPS.
>
> I will add a part about this to the documentation patch. In this
> current series, FOPEN_PASSTHROUGH under FUSE_PASSTHROUGH_INO does not
> imply FUSE_PASSTHROUGH_RW_OPS. FOPEN_PASSTHROUGH can be set with just
> FUSE_PASSTHROUGH_OP_READ or FUSE_PASSTHROUGH_OP_WRITE and does not
> require both (eg server wants to intercept writes for logging or
> encryption but reads can be passed through). For mmap, it would only
> be passed through if both passthrough read and passthrough write are
> set. In the non-FUSE_PASSTHROUGH_INO model, FOPEN_PASSTHROUGH implies
> both passthrough read and passthrough write.
>
> Do you think this makes sense or am I overcomplicating things?
>

I think it makes sense.
My internal customers have this use case (passthrough only read).

I have a library (libfuse_passthough) that implements fuse passthrough
template fs in userspace and this library currently uses kernel passthrough
only if both passthrough_read and passthrough_write have been requested:

https://github.com/amir73il/libfuse/blob/fuse_passthrough/passthrough/fuse_=
passthrough.cpp#L997

Note that the library provides this granularity at open time, not lookup
but we can also think about extending the FOPEN_PASSTHROUGH
api later to allow this.

> >
> > Does a server need to opt-in both for the read/write operations passthr=
ough
> > and the specific file (I guess so)?
>
> Yes, in this current series, to use passthrough read/write, the server
> is expected to set read/write ops in ops_mask when registering the
> backing file (inode level) and set FOPEN_PASSTHROUGH when opening the
> specific file (file level).
>
> I left a comment [1] on your other comment about dropping the
> expectation that the server needs to set FOPEN_PASSTHROUGH in the
> FUSE_PASSTHROUGH_INO case if it provided a backing id in the lookup
> and set passthrough read / write in the ops mask - I'm not sure if
> that was what you were hinting at or not.

I actually did not mean that, but now that I think about it,
FOPEN_PASSTHROUGH + backing_id could mean as today
"request passthrough for lifetime of file"
FOPEN_PASSTHROUGH + 0 could mean
"request passthrough to existing backing inode"

IIRC, the value of 0 as backing_id was intentionally reserved
for this purpose.

> [1] https://lore.kernel.org/fuse-devel/CAJnrk1b=3D5vRgm1otKAiaeFJr9_J-aLn=
oVTp4MHAz2mBKtcE2dw@mail.gmail.com/
>
> >
> > The concept behind the inode iomodes is that it is not allowed to mix c=
ached
> > with passthrough ops on the same inode, because there be dragons.
> >
> > If the server wants to opt-out of passthrough for a specific opened fil=
e,
> > which already has a backing inode, it must explicitly request the combi=
nation
> > FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH
> > and then direct io will be performed, despite the inode having a backin=
g inode.
> >
> > What you have done here is a private case of passthrough opt-out
> > not per file, but per operation.
> >
> > The bottom line is if the fuse inode has a backing inode, then you must=
 not
> > fallback to the fuse_cache_ operations in case the op is not in the mas=
k,
> > but you may fallback to the fuse_direct_ operations.
>
> Thanks for pointing this out. I will add this enforcement at the
> kernel level for calling back to direct operations.
>
> This is what I have in my head for how it'll work:
> - server opts into passthrough for both reads and writes
> * server sets FOPEN_DIRECT_IO: reads/writes will be forwarded to the
> server, but mmap will be passed through to the backing file
> * server does not set FOPEN_DIRECT_IO: reads/writes/mmap are passed
> through to backing file
> This is the same behavior as the non-FUSE_PASSTHROUGH_INO case

yes.

>
> - server opts into passthrough for reads but not writes (or vice versa)
> * mmap is never passed through, mmap will always go to the server
> * no data caching will be done whatsoever

mmap cannot go to the server without page cache
and this is what we were trying to avoid.

> * server does not set FOPEN_DIRECT_IO: reads are passed through,
> writes are forwarded to the server
> * server sets FOPEN_DIRECT_IO: no-op (same behavior as if server did
> not set FOPEN_DIRECT_IO)
>
> Do you think this makes sense?
>

Unfortunately not.
Splitting reads from write logic does not work for mmap at all.
User always read/write to the same memory, either mapped
to backing inode or to fuse page cache.
The logic of iomode.c is that if a backing inode exists mmap
always maps the backing file.

Server could request to get normal READ or normal WRITE or
both by not setting FUSE_PASSTHROUGH_OP_READ/WRITE in
ops mask, but it cannot opt-out of passthrough mmap.

> >
> > I hope this does not complicate things for you too much,
> > but I also don't know (yet) what you intend this gating for.
>
> Thank you for your feedback, it was all very helpful!
>
> The intention of this patch was to support cases where the server sets
> only read passthrough or write passthrough but not both. In this
> scenario we cannot rely on "ff->passthrough !=3D NULL" to know whether
> to pass through the read or the write, so we need to check the
> ops_mask. My intended use case doesn't really need this, but imo I
> think it's overall a useful feature that other servers will want, but
> if you disagree with this, please let me know.

I think it is a useful and common use case and the implementation
should be quite trivial following the lead of the FOPEN_DIRECT_IO
per-file opt-out.

Thanks,
Amir.
