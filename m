Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55343E5A33
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947913; cv=pass; b=u/UAzhcPneV4IM5UnfDPBMAPN8uUtMt638nSwDzQnbl5aV0XeJLV07ba/uSRheCNg/jumcZpDzqNuNWtq/QK1xs1PKR1IS5AG3KFMfK0VpeUj3moOrsYpj5iIkL2xorrkJlfA84EmFkJMzcMjfxYOt0T9z4r1h9mbjC5layWkKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947913; c=relaxed/simple;
	bh=Q7nlBd/BqBQHvksCEGaenGOCteLulS+SgKiHUiSNSEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsgUEJkpGUuZRd4gDwRlNjtB8nb4do4ymOOcXU0DFu5PPkZk/GVMwusIh1a9WdLV0aY8M/DsaE9HjtWVtVD9q96fBMWpwsEFIrs6TBVqLqWlxTcQGVSEMzvVLnXz7w67bAM5oKoB6ppJveZpMplYOPCdFEhaphxlTeMEyk4OjQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXVh87PD; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXVh87PD"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd4d7f4fa02so166051266b.3
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 09:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778947910; cv=none;
        d=google.com; s=arc-20240605;
        b=EASNJptVyB+NSED8/BiDQ/GiBwUgDCWdRtEYEDEuQOG9RxGXTnf+fYZxp1HMIx9e7V
         j6cfc/yfv4uqy51V1rMquSlp/CXQElQWCNIfL3SE6E1IAxVr8U8qL4Cj6kKHN0mpih99
         Y8Hd/torGb5eVraNX6QpVCcvw0crfAHlGy64EWle1Fua87uymPPkLwXjx6EYhsICq5Pw
         13EzixIuNBjkH4QvcocWoJh7WUXhpbNZfFPM/PK7TiqpCbn1dzYMZgwDARXYmBwN4eQ+
         KPCTguS7+XlQcN+6qBm++5CeiQFvYOFI5p9ouQ+OtvGKw1r9h+EPe+Wq4Wno4+0Vs5qY
         LCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAZW2MBE8275Ldt0n/IGNTEv2ZI5Fh5vxkOF7P2VqHg=;
        fh=759FKc3ZeWC4HXkllaw8Ay4OW5z3G/mAF1qE3sOHOF0=;
        b=IjNJbe8TJjXC/sxWazJuRVT04ChBI8pSSSsKPnIK/KX8XPeiPPNEG71waiqeBmdZvd
         h4DoIHobzh7pgsbQYKP+rPoJ19BVDQydoeIldb1oM/5O4ponl+0kezarUC1zCbrdIc12
         pb7Z75wa+Rm24EAkTUuo+wLjx+5tMwW67xCPwRtbbaMKCNs5Wd5t6oBy/7OpD3OBKqAO
         43PfC3oMwQ2l2XLbsNqOgmN4MwAqPtBjnrmNg7xQN+efZm/9lIQuZGRxrKGIUG9E5L3L
         11bk/KmfswcxyP+Glp9C12EACl1RGruVtlnI0DfZov062uQi+4gtlBpxQZgN5G2Olpc+
         1j2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778947910; x=1779552710; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAZW2MBE8275Ldt0n/IGNTEv2ZI5Fh5vxkOF7P2VqHg=;
        b=mXVh87PDLNUJTxJiGOifUe4PprhwYUQBu0JXQVR6o+QJMt64znM1PZmvWrly3Vqlvm
         tClpBr9YdD5POAoqeKl4M/OtGEuEX6n8MyBahv6ktoUUUeIlgf279Wz7GMvbgq311Tia
         TbjHamZ34zF+RnnAwoEfGrgPnoT2NvIaz+g8mkH/1sFyPZOiYwZ2Bttapm/BsppIDcaw
         UC8HNRSKeLV+imKXxdIZJiiQtRzthuD9R1y9QhbXxgiTIIhRqrpLwUxpl5HVZKZQ0xEb
         ihMsEd0qqFGf91ZBQq5GtBO+vkTW2LAZM7a8oxfe6aw9+k7EuTdRm/3LnLSDcUk6antz
         MvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778947910; x=1779552710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uAZW2MBE8275Ldt0n/IGNTEv2ZI5Fh5vxkOF7P2VqHg=;
        b=aHOI+Vivs76SPGaP7GzFcRR1stjk9YuoVUP9uUBJUQSRyQPwPWspKsHNtVn5HxUBzg
         yA2vUWMitUpqpLsX9V7QHQB9463UG69z0KbiRjqpUVZLAOgHduuOfW9sgwWt3ohnBxQW
         g1oblxYgF5RcJkJXiOWwCsCQa6OFjzsh9JJlEc4kdPI6yOdwb5pskaBygEaN1LzloU2S
         qVm9vyc3j66liH1DUJlEqMgQbZmDbn+ettZhM5pRkW+q9eeZZLNi9daLi9t9ALvyGkMp
         eu7Nx5RgTb23GXxAQfcCHoj+HWDs0ZFGy9fkgjtROJZfL/9/NkYTtBR6Z1NWrV0UC1Cu
         LhMA==
X-Forwarded-Encrypted: i=1; AFNElJ/53yuwIpRu71aKDjHFlg2Nd7eBtc4r6Du3Q2Y/x+MxXA2Lml5go7sov20y8FJ+9Ma3fiGXAqlag+3w@lists.linux.dev
X-Gm-Message-State: AOJu0YwfHTB0IvJ85rx47PdaTUbQXXfjvCgM1y95MgYbdqLI/O9ljkwB
	14Sfn+XHhW8+DLMOkAuzDrZCtBFndqDlOObfOh7p7uaDI/RqOVuF4FsKPSxHsg82NdTNduQJcBj
	nFo3TrzSZKr/7x+Bn9Z3pwCP0H2QKm2I=
X-Gm-Gg: Acq92OHj4KQHD5DQ9i7KfanRJJGB/LMch86zawQ2qnEI2zZpDxTHzAKxr656v96gugk
	TI0y5+qqwYyzULfvRav+4WHLWx0l2MMosksxvg+W3DP5wZWg5bTbEAlxCAxzkZB9NP4L/rmG4rU
	hStRWyTmjC/3BqhPxwtKlqY+S8B0iTHQ17q7DyRcnztJ/+cChU624j+MeoMnOWBtFmWVdmiZ+bA
	Y7NzHRYH9TasMuXwcimPo3un0fuzAiVqpMVauLth5Uv4QTiJVBiiFcJ0MG48bNIVRJFYN3nE8eJ
	kLE35fbEdprTwMjnYOv0O1mR5SVTJa+8n2rQpVSKD3HnZE6Trz2W
X-Received: by 2002:a17:907:c714:b0:bcf:9dd2:f79e with SMTP id
 a640c23a62f3a-bd517964d82mr481784066b.29.1778947909758; Sat, 16 May 2026
 09:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-3-joannelkoong@gmail.com> <CAJnrk1YUjqd+j1yLXuO0M07ueCUYNC0NqgwmQSm3OiY3hnhgZQ@mail.gmail.com>
In-Reply-To: <CAJnrk1YUjqd+j1yLXuO0M07ueCUYNC0NqgwmQSm3OiY3hnhgZQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 18:11:37 +0200
X-Gm-Features: AVHnY4LRXBoTp7VSRpHV_Q0T8iOBc_MEV3aFDSOimmKfnbZNrPwrIz-QjGpKgXA
Message-ID: <CAOQ4uxhyZU_6jbv8kY8od_SgG9yQ6aX+KcB2c1um4DajJdSPqA@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] fuse: prepare for passthrough of inode operations
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 3:34=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Fri, May 15, 2026 at 5:52=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > From: Amir Goldstein <amir73il@gmail.com>
> >
> > So far, fuse passthrough was implemented for read/write/splice/mmap
> > operations for regular files opened with FOPEN_PASSTHROUGH.
> >
> > A backing file is attached to a fuse inode, but only for as long as
> > there are FOPEN_PASSTHROUGH files opened on this inode.
> >
> > We would like to attach a backing file to fuse inode also without an
> > open file to allow passthrough of some inode operations.
> >
> > Add field ops_mask to the input argument of FUSE_DEV_IOC_BACKING_OPEN
> > ioctl to declare the operations that would passthrough to the backing
> > file once it has been attached to the fuse inode on lookup.
> >
> > Setting the FUSE_READ/FUSE_WRITE operations in the ops_mask is not
> > required because those operations are implied by FOPEN_PASSTHROUGH.
> >
> > When setting operations other than FUSE_READ/FUSE_WRITE in ops_mask,
> > non-regular backing files are allowed, so we need to verify when
> > attaching a backing file to a fuse inode, that their file types match.
> >
> > For simplification of inode attribute caching, for now, require a
> > filesystem with FUSE_PASSTHROUGH_INO (one-to-one mapping from fuse inod=
e
> > to backing inode) for setting up passthrough of any inode operations.
> > We may consider relaxing this requirement for some inode operations
> > in the future.
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  fs/fuse/backing.c         | 13 ++++++++++---
> >  fs/fuse/fuse_i.h          | 30 ++++++++++++++++++++++++++++++
> >  fs/fuse/iomode.c          | 16 ++++++++++++++++
> >  include/uapi/linux/fuse.h |  9 ++++++++-
> >  4 files changed, 64 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> > index 4be9ccc5b3ff..0f1e1c1ec367 100644
> > --- a/include/uapi/linux/fuse.h
> > +++ b/include/uapi/linux/fuse.h
> > @@ -243,6 +243,7 @@
> >
> > +#define FUSE_PASSTHROUGH_OP(op)        (1ULL << ((op) - 1))
> > +
> > +/* op bits for fuse_backing_map ops_mask */
> > +#define FUSE_PASSTHROUGH_OP_READ       FUSE_PASSTHROUGH_OP(FUSE_READ)
> > +#define FUSE_PASSTHROUGH_OP_WRITE      FUSE_PASSTHROUGH_OP(FUSE_WRITE)
>
> Do you think we should couple the passthrough op code to the fuse
> opcode so closely, instead of defining the passthrough ops separately,
> eg doing something like this?:
>
> #define FUSE_PASSTHROUGH_READ         (1 << 0)
> #define FUSE_PASSTHROUGH_WRITE       (1 << 1)

Don't drop the _OP_ please
Need it to distinguish from FUSE_PASSTHROUGH{,_INO}
and we need to think if we want to format this as 32bit and extend later
or start with a u64 ops_mask format from the start.

>
> In the (far) future when some more advanced passthrough features get
> added (eg full subtree passthrough), it seems like we'd want to add a
> passthrough op for that,

I don't know. fuse_backing_map has flags, why would we want to put that
in ops_mask.

> but that wouldn't map to a fuse op. I think
> there are also some fuse ops we might skip defining as passthrough ops
> but are implicitly passed through (eg FUSE_STATX which is covered by
> FUSE_GETATTR),

This could also become the case with FUSE_CREATE{,_HANDLE}
or {FUSE,FUSEX}_CREAT.

TBH, the fact that some ops will never be in the mask and
that some ops have a canonical bit in itself does not justify creating
a different mapping. Do we also want to squeeze the mask into 32bit
and leave reserved space? my intuition is to leave it u64.

> so it seems more intuitive to define the passthrough
> ops as describing capabilities rather than implying that it describes
> what specific opcodes get passed through?

hmm. I guess you have a point that it is a bit limiting to commit
to this arithmetic in UAPI.

My thinking behind this was ease of use with these helpers:

       if (!fuse_passthrough_op(file_inode(in), FUSE_READ))

but those could just as well be macros:

static inline bool fuse_inode_passthrough_op(struct inode *inode,
                                            u64 opbit)...

#define FUSE_PASSTHROUGH_OP(inode, opname)    \
             fuse_passthrough_op(inode, FUSE_PASSTHROUGH_OP_ ## opname)

#define FUSE_BACKING_MAP_OP(map, opname) \
       ((map)->ops_mask & FUSE_PASSTHROUGH_OP ## opname))

...
       if (!FUSE_PASSTHROUGH_OP(file_inode(in), READ))

wdyt?

Thanks,
Amir.
