Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1F6398902
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 02:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826646; cv=pass; b=cIbtCYKF5hxTcPJGzSBXjNML347RPg0M9ues0+aEqKpnR8gR5irBjliNRlH1/WmBfEbcubog8N4uHByOIroimK9/AGm3lYLvhvYoqsrt3CEctWkvAnV2b/3VFxUkaReYHkYoqmRVfztPIn+tIuEjoM6neFvG9wtsnS+B/eqEHdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826646; c=relaxed/simple;
	bh=XjFxiXyFPAmrrvHBO5esXfLQsrjD4qHhClIiDmZ0/E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYvwdbvMLzabyuL3uUtAiHc7aHsZxA1/XOLFuUK3CxA7fldmMwADD7hq9Qv2b4bKvIh4dSZT1jSDaAaynAzfXv0WUfl+cx8ebExAH0y94KqTyAv8Ir7/K5X/mSFdGzJdoK4uEppWZ0XHx24zYEVZDsZnK3ymZTZbot2303sD8rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrxRyW7d; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrxRyW7d"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so37688445e9.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 19:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776826636; cv=none;
        d=google.com; s=arc-20240605;
        b=dXeF6HFKp/JIclH9VP3sgrMeO+rNMihpZ80NRR4nqdMbZRPIHoEiN+I2mrOs/FMFkx
         ZkmkwEJ3TT8WSytT3lwEeixQryQQ3bEQQ74DxYDtYffN0UazLdim6ukhGwOF/sDwSiRs
         PWjD4A+VyZuJYwB5f2/OxB891du8YsAKbE65FF5qoHgP7G+RQdYWcT+dfe/tRO20Yy2q
         aaljCCG5RdCIkt9b1+eCX3FkzOODrQ7HvJzggiOANUVct8szLnjf2vIwGrDR76CrJ+pk
         NIxbIwuUBaK7UGQte1+BIlwQRaeZxsIOZqkzFfVCtKPKorMsZNTq5Iz5Ty0U5Kd8usY0
         VZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODeG4bfKoUk2CRRVuOIAQXv2GTBXR1GdPHPeMh73G48=;
        fh=ghLvPwr6nPc1FBlJCOn5wVmBysKdCn9i4jXtUP85qUo=;
        b=NKFN9C8NU8O6Akxba9Bvpo6dgJo7qsgsfu83ZCVVlf2yn+Ie9RQFMMwe7idfSrJ0uZ
         urezyC/qLli9phSUb1i+ZaS1zfjvntph6JYch1ytbaeCSWdCWytsp6dHp+CiXKggCicp
         iRCVM1XRLPA497hZjNsNyhwkKjo1DGn6/XuPMMN1Yw+DY5q0fW3h9ULiOsYGsNtlvKgn
         iEDnNDbvxiYgPjy3gCxlUkdW3Ct5EAuot4PXzcVKaGM6OZTpOvqUJPHT0tqEl83ofevQ
         fTCox0EBeXf3EXOGno5mr3HEb1Jz/RHl2Ti17zE/xp7CPYrQ/vqKXPiJyPsKk58c7ZE5
         0C2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776826636; x=1777431436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODeG4bfKoUk2CRRVuOIAQXv2GTBXR1GdPHPeMh73G48=;
        b=RrxRyW7du/Ui+LmjO+yKEheyZH3dJDsLYhrZMX6MKjMyrMpT5m4M6JbJv3g9zUlHCp
         vBEj64/w3ap302i2L3+tl1sHGuwWGsLmY/BeHrerNPMaO8MKuS50Qm9mHseprMTSyTU2
         yxLsLESVSRjpS4Fx84bvKFVlPDL9L1Zs/hqzjB2Y3AJ9Pfk1jmh5LQHHQJ9Sr2q204T9
         pkzImLS7Sbwow2UItoxDSIfcUFJbxT6B9ck8bZguYSm9/gqtcAsJZauMGGsSJLfQJHeJ
         uug/YCLIouxU9VtRN/YMtuUKIJx6nxPacc8M8uhPIJbTMosVqqv1Vhw8MfQQ6eepukfX
         3wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776826636; x=1777431436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODeG4bfKoUk2CRRVuOIAQXv2GTBXR1GdPHPeMh73G48=;
        b=MNtPtV0o7omU7GAU0RRTVE1EgkTThN4Ls97Jzd5lLw47bvSTzBvqENgi2AU43Ns7qt
         ib1bW02a1mhjwqBJ1NKw/rV21mtB3rXepw/6GXmy5V1f35OeNx4e3ErdQLrkNxzzsOlk
         /zI5x2Fih4yhDlZ4j2ha2IdFFrLK91XUa/K2ZUCHIpvB8/pJxIGIuyJjYzYyOT0jCwom
         UTndTETTYANQ3nQKdkt63v2LfjeQhwZThxbA5qCieTWAZBdfoTG1aV68gie/zRjEtahH
         M50hxU7v98w+VXkm6TYXfhPqxvEeJbpgtMxF1HcEHhc4ZzVkraOYCVC4VTwCRxHZp6qJ
         da7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8BDGf3C6zqdiUplo97X8FnnUSoYWUcXSb6ZtVmBmcfKkl3WGYPMi+LVl8XvRpAii9DiZgvWwuDSxEk@lists.linux.dev
X-Gm-Message-State: AOJu0YzqzJU/aMqOHfZGaerDGtOCkLegVO8220Ttin3CEZgeOZ/diMiv
	d1h0zkVSvW4CMglqIlT1a2EWEjEysCWt2Run7uwMfVlh7oMS63HBpU0XtDH+P9K/9fW9tvXhtHl
	98yzHF6Ceyu5I4beFKoTY2lrQEiXR+6h/AmQjXrI=
X-Gm-Gg: AeBDiesP99psl1VYYOc7IuuIXtUaqzW1K8pNdD2JkTn2NBbPX0gTjp5NZFF0ex07DqV
	j+7Cf2dfhsN5tCDVNWVL1OEs8SO3TCILQCJma7Ibq/hbwBpUuPmP70/Lkc5JMJyuWnkNJ0ffC4A
	woQBZ8sI9g7g74JQTeSxMIjr3qOUiv15hK/IlaMuivIylquniaBXBL2R1WTeFz4J69xJiEOxXJ5
	D2TYca3Y+/+1Ufvwfw/Km01/CSX7/vXEZq5hWE8pMSLKqZ6gZ5tIGdlZMAcNM54MSDuLgcEnbao
	5iNjg6oTD0ZxZmkb
X-Received: by 2002:a05:600c:4ec8:b0:485:7f02:afd5 with SMTP id
 5b1f17b1804b1-488fb755caamr306131485e9.13.1776826636305; Tue, 21 Apr 2026
 19:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-9-joannelkoong@gmail.com> <CAOQ4uxh0E6BtxRVsJdvebybnvU5+n-bur-+SPySNAbKzdY59vw@mail.gmail.com>
In-Reply-To: <CAOQ4uxh0E6BtxRVsJdvebybnvU5+n-bur-+SPySNAbKzdY59vw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 19:57:05 -0700
X-Gm-Features: AQROBzByH6O69bgjFTDNRAKGMjmRX3RxBrewm5nEptROW8ohpGmO8bwH6Aj4ubg
Message-ID: <CAJnrk1YWpAZR5bck27s2P-Zm1s9O0VMMHNztEOMYutVgQ=CwGQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/17] fuse: add passthrough ops gating
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 3:48=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Route existing callers through a passthrough ops mask check to verify
> > whether passthrough can be called for the operation or not. The check i=
s
> > only done when FUSE_PASSTHROUGH_INO mode is enabled, which preserves
> > backwards compatibility with prior passthrough behavior.
> >
> > It is safe to get the backing file by accessing ff->passthrough directl=
y
> > in passthrough.c because passthrough.c is only compiled with
> > CONFIG_FUSE_PASSTHROUGH=3Dy and the caller has already done the ops che=
ck.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/file.c        | 14 ++++++++------
> >  fs/fuse/fuse_i.h      | 14 +++++++++++++-
> >  fs/fuse/passthrough.c | 12 ++++++------
> >  fs/fuse/readdir.c     |  2 +-
> >  4 files changed, 28 insertions(+), 14 deletions(-)
> >
> > diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> > index a15fb508fd28..45d9184d0f7a 100644
> > --- a/fs/fuse/fuse_i.h
> > +++ b/fs/fuse/fuse_i.h
> > @@ -1630,9 +1630,21 @@ static inline struct fuse_backing *fuse_inode_ba=
cking_set(struct fuse_inode *fi,
> >  struct fuse_backing *fuse_passthrough_open(struct file *file, int back=
ing_id);
> >  void fuse_passthrough_release(struct fuse_file *ff, struct fuse_backin=
g *fb);
> >
> > -static inline struct file *fuse_file_passthrough(struct fuse_file *ff)
> > +static inline struct file *fuse_file_passthrough(struct inode *inode,
> > +                                                struct fuse_file *ff,
> > +                                                u64 passthrough_ops)
> >  {
> >  #ifdef CONFIG_FUSE_PASSTHROUGH
> > +       if (!ff->passthrough)
> > +               return NULL;
> > +
> > +       if (ff->fm->fc->passthrough_ino && passthrough_ops) {
> > +               struct fuse_backing *fb =3D fuse_inode_backing(get_fuse=
_inode(inode));
> > +
> > +               if (!fb || (fb->ops_mask & passthrough_ops) !=3D passth=
rough_ops)
> > +                       return NULL;
> > +       }
> > +
> >         return ff->passthrough;
> >  #else
> >         return NULL;
>
>
> Please document the relationship between  FOPEN_PASSTHROUGH
> and FUSE_PASSTHROUGH_RW_OPS.

I will add a part about this to the documentation patch. In this
current series, FOPEN_PASSTHROUGH under FUSE_PASSTHROUGH_INO does not
imply FUSE_PASSTHROUGH_RW_OPS. FOPEN_PASSTHROUGH can be set with just
FUSE_PASSTHROUGH_OP_READ or FUSE_PASSTHROUGH_OP_WRITE and does not
require both (eg server wants to intercept writes for logging or
encryption but reads can be passed through). For mmap, it would only
be passed through if both passthrough read and passthrough write are
set. In the non-FUSE_PASSTHROUGH_INO model, FOPEN_PASSTHROUGH implies
both passthrough read and passthrough write.

Do you think this makes sense or am I overcomplicating things?

>
> Does a server need to opt-in both for the read/write operations passthrou=
gh
> and the specific file (I guess so)?

Yes, in this current series, to use passthrough read/write, the server
is expected to set read/write ops in ops_mask when registering the
backing file (inode level) and set FOPEN_PASSTHROUGH when opening the
specific file (file level).

I left a comment [1] on your other comment about dropping the
expectation that the server needs to set FOPEN_PASSTHROUGH in the
FUSE_PASSTHROUGH_INO case if it provided a backing id in the lookup
and set passthrough read / write in the ops mask - I'm not sure if
that was what you were hinting at or not.

[1] https://lore.kernel.org/fuse-devel/CAJnrk1b=3D5vRgm1otKAiaeFJr9_J-aLnoV=
Tp4MHAz2mBKtcE2dw@mail.gmail.com/

>
> The concept behind the inode iomodes is that it is not allowed to mix cac=
hed
> with passthrough ops on the same inode, because there be dragons.
>
> If the server wants to opt-out of passthrough for a specific opened file,
> which already has a backing inode, it must explicitly request the combina=
tion
> FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH
> and then direct io will be performed, despite the inode having a backing =
inode.
>
> What you have done here is a private case of passthrough opt-out
> not per file, but per operation.
>
> The bottom line is if the fuse inode has a backing inode, then you must n=
ot
> fallback to the fuse_cache_ operations in case the op is not in the mask,
> but you may fallback to the fuse_direct_ operations.

Thanks for pointing this out. I will add this enforcement at the
kernel level for calling back to direct operations.

This is what I have in my head for how it'll work:
- server opts into passthrough for both reads and writes
* server sets FOPEN_DIRECT_IO: reads/writes will be forwarded to the
server, but mmap will be passed through to the backing file
* server does not set FOPEN_DIRECT_IO: reads/writes/mmap are passed
through to backing file
This is the same behavior as the non-FUSE_PASSTHROUGH_INO case

- server opts into passthrough for reads but not writes (or vice versa)
* mmap is never passed through, mmap will always go to the server
* no data caching will be done whatsoever
* server does not set FOPEN_DIRECT_IO: reads are passed through,
writes are forwarded to the server
* server sets FOPEN_DIRECT_IO: no-op (same behavior as if server did
not set FOPEN_DIRECT_IO)

Do you think this makes sense?

>
> I hope this does not complicate things for you too much,
> but I also don't know (yet) what you intend this gating for.

Thank you for your feedback, it was all very helpful!

The intention of this patch was to support cases where the server sets
only read passthrough or write passthrough but not both. In this
scenario we cannot rely on "ff->passthrough !=3D NULL" to know whether
to pass through the read or the write, so we need to check the
ops_mask. My intended use case doesn't really need this, but imo I
think it's overall a useful feature that other servers will want, but
if you disagree with this, please let me know.

Thanks,
Joanne

>
> Otherwise, this looks ok.
>
> Thanks,
> Amir.
