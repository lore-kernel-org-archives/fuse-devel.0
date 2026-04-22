Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D12A1AA
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819034; cv=pass; b=Ma09GfQaStYTcO5Zxhojpdr9u6hxy42KaZVHCaKNPWTEzx57NYpK6iGtx6nrMp10JMwybmZ1gDMzwxTXRRBfqIv1htfR9CKJEC+W9nkzcGD0N34IsTlNB3Z6TEFrYAtZhIf9m7BawyFPEpvvXSqdJos8mYa2okSpaBlncQABDCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819034; c=relaxed/simple;
	bh=E4BY4wjwmoS/TAN3eVkeexcpNDIx8Y1Wc38vGDyFBDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9WRSlwvsAcvYfbqg/aVJdC+Hq8+ocDOoU/RDWgvCEMsJeHH2J+1/rVJ1C0jAHgnr7qYzkSC/hi2gRuew0iS5kMtdZrooIiaZaDJKJ0mxrJHu+Pe9f/c7YMYPWDJcqxp4sPeb4657WiokKGkkgu9tZZInQnjmQb1hhhkNuRZkFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJUiJdMz; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJUiJdMz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so2515691f8f.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 17:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776819031; cv=none;
        d=google.com; s=arc-20240605;
        b=SegcC/sXmx1OgjifQsC708vm2iAtC+0ptkfed+iUMTRGsW2BmJ5WCKLfoH7BigSS8/
         6thLSoHq5Q+IypynXUX8PJTpS26pGbWLB9/fGINRgBmuehARf7t32SEjpRGio6MCve+5
         dFIcPUn2iGKwb5uZ/BgYrvY/IaR0S8D2dygUR5HyCwV/m7jxxhj1gK6+yNVZqc5XTKyi
         zX3sqyMXua+g2Rw0ndCmGrwYBoYQXf3qWyjZ+ysRlguNdNQVwHNAVzYdeD6pUK4o1MfZ
         p0QyoVanKq2Ahg8XLKhSmMSbuXQY2UdHHQMcbtFOojpI1XoFVGVqKjk1dgv00tsg7i2t
         16mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Esz28jYiAu2THnqAAFw/iFehujE2L85tyzFG+R4zo2M=;
        fh=z8UcMoUBJBtMUkydwvZGWpUdYiBeM8RlRkpRehhI6vE=;
        b=OxJoGtoqlcv8EXIu3u0xMWt5MTTBmDa+NyWOYrBYDXonakQDpi3utj7McqUBNxriPB
         2J4BqLDa8dWAgN2HGIYt9TGc9N8mFqMq6TOaCoPVJaYXMMTRtl/ihSoreS0h3KCr9R6V
         wlrt+NGg/HicEEkkTej0o54JfVFtKHMdHT2f0fqHnih7cuCXBxq4VKHfYbdszfEj89sI
         rvXyvRBi99a77+yi20J5NnGGf/JWb9VVBg8+olsWiJrj7rvQKrP1ufibkiKB0yrOiPR4
         5zJ9ni8y0PgZIEgAVW35x1WgPpmAkPkl1TtPD+plmwQxXRQpoKwoDNrfeocY9m2Szvep
         TBgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776819031; x=1777423831; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Esz28jYiAu2THnqAAFw/iFehujE2L85tyzFG+R4zo2M=;
        b=fJUiJdMzPaB3yawaDDPyJMowHgcF1Yf6k6KOpmj7uSszGKJsCTxFcehxvFroptwezy
         Z0wadfQesngvOSELh8VkTq1YwGsaR32g2i12qD6ck0z+tq2yhjXJUp86eE1Q0z0L0gmH
         C827397lDU11cFCie9DkG4kAUT1XNc2UFtjQuP/gSGEO6G1tCpq1yUW5DNUH3RPRtwrx
         zXTBBSMtSHY607+lJh0ohWAH3/oQ01fa3UQQ5OkJEyMpnPv4wP1IPK+HANM8R+3/qOgE
         Eb9yu2HgpsxWyHX8f96DbuLYmf9Y2ZHVuBJZ5Dn4k9KA9axwdPVJ+J1Ns7CWInKDzvwV
         Exnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819031; x=1777423831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Esz28jYiAu2THnqAAFw/iFehujE2L85tyzFG+R4zo2M=;
        b=nkNkKd3zDntTrKHs/J4FHQD6fNkTQBxszQAuvMPjPkmlifsSGCR6EPMyKoEtOC8gAV
         h/YBTuC17xb/2k8nDVfDIxs6FL1D1ElaOsSiy/QlJXiAYlP1ueJpiNyFpyN/3yXEmULQ
         r740MSEKPeqYrR009izm0rO9Q9qBVfJIcT1J+29k+/+miNmhwwcy1PpEOLV+WrT97Kyf
         QKXUwwYmCZFee/Il9HoAlp6KG8zksDP8ouWnTEkRE1rRPsvQ9VMkUPfQiABsbT3KZjXK
         4cyzeMD3XbqAUECELy6LYmuRKgvPCy9lbx4dyxioK/ZDGQyro4dOcP3ozeM2bL57/23e
         RB+w==
X-Forwarded-Encrypted: i=1; AFNElJ/nYWkeq9a2VH0APN03p2M/oXSWonQlJNkzifemmVgHVxZAwA8LfrYrgNFdcRYckMRCJds8//XX1Rhb@lists.linux.dev
X-Gm-Message-State: AOJu0YzGm9tN6QspXnCakISL9vP5Auu7FLD3XU7Sng+OcdrH0vT1qKj8
	FJiae8+JMuyCqy1dPMLmFqV7ejpVqc4zYUS78IRBtH+uhwTbPyW0BUayAY823DzE4Vo0c/EFsZl
	Ri+LSln65ubvIXKXh8k6c80yWRdBsX8g=
X-Gm-Gg: AeBDieu//57fbGSjmjmQii9UxNd1ZQ9or8PzUm08DV1wMW5+j7ikpXeJcehEoO3rFRp
	1znKvOFIcJesO3E1ZE5iGQBGZpEzqYQU4Nk1dAebna60OGmazjhjfyKCCoSeu9+xMX53xd5cfm3
	jeirAgUrvgKWS8CQFq2ttPFQLWvxrkW12u7WOHsw3YTCt6xrGyS+teRMGWwSuxzmXweFLYxI4q8
	OffqQK2uvIwMVJAg07os1B74VkwbbyTA5L2OTAM5rjc58IQ7D1+2cXuZUYfJkZDiWAGaZ0o+ThP
	hIED/HnXyoAX4BJc
X-Received: by 2002:a05:6000:1a8d:b0:43b:8806:be32 with SMTP id
 ffacd0b85a97d-43fe3db3b49mr30284089f8f.7.1776819031073; Tue, 21 Apr 2026
 17:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-11-joannelkoong@gmail.com> <CAOQ4uxiAW99ZftcLkOLjmNc24n8DGHnk+rpgAe1PX4aRoCXGsA@mail.gmail.com>
In-Reply-To: <CAOQ4uxiAW99ZftcLkOLjmNc24n8DGHnk+rpgAe1PX4aRoCXGsA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 17:50:19 -0700
X-Gm-Features: AQROBzBS2aT4AsP1r3rmZrxH3xwTWMk2K3IHFQFZcmmFhY3DpZfkJWd_Gf3UKQA
Message-ID: <CAJnrk1YGOfKx-RVy==stpiKQELMZNaZqK9PnGSDtjVSFvtox4g@mail.gmail.com>
Subject: Re: [PATCH v1 10/17] fuse: add struct fuse_entry2_out and helpers for
 extended entry replies
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:25=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Add struct fuse_entry2_out, which is a new extended entry reply struct
> > that carries a backing_id and statx attributes. This will be necessary
> > for setting fuse passthrough on inodes.
> >
> > Add helpers that subsequent commits will use to process fuse_entry2_out
> > for passthrough support for lookup, revalidate, and create.
> > fuse_statx_to_attr() is also moved to earlier in the file to avoid
> > forward declaring.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dir.c             | 119 ++++++++++++++++++++++++++++++--------
> >  fs/fuse/fuse_i.h          |   5 ++
> >  include/uapi/linux/fuse.h |  14 +++++
> >  3 files changed, 113 insertions(+), 25 deletions(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 94ab05cb89ce..0eacfef52164 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -354,9 +354,9 @@ static void fuse_invalidate_entry(struct dentry *en=
try)
> >         fuse_invalidate_entry_cache(entry);
> >  }
> >
> > -static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
> > -                            const struct qstr *name,
> > -                            struct fuse_entry_out *outarg)
> > +static void fuse_lookup_init_simple(struct fuse_args *args, u64 nodeid=
,
> > +                                   const struct qstr *name,
> > +                                   struct fuse_entry_out *outarg)
>
> Nit: patch 11 would be nicer if you add the arg now and pass NULL from ca=
llers
> skipping this temporary fuse_lookup_init_simple() step.

That is a much better way of doing it, will do this in v2.

>
> >  {
> >         memset(outarg, 0, sizeof(struct fuse_entry_out));
> >         args->opcode =3D FUSE_LOOKUP;
> > @@ -372,6 +372,95 @@ static void fuse_lookup_init(struct fuse_args *arg=
s, u64 nodeid,
> >         args->out_args[0].value =3D outarg;
> >  }
> >
> > +static __maybe_unused void fuse_lookup_init(struct fuse_conn *fc,
> > +                                           struct fuse_args *args,
> > +                                           u64 nodeid, const struct qs=
tr *name,
> > +                                           struct fuse_entry_out *outa=
rg,
> > +                                           struct fuse_entry2_out *out=
arg2)
> > +{
> > +       bool use_entry2 =3D fuse_use_entry2(fc);
> > +
> > +       if (use_entry2)
> > +               memset(outarg2, 0, sizeof(struct fuse_entry2_out));
> > +       else
> > +               memset(outarg, 0, sizeof(struct fuse_entry_out));
> > +
> > +       args->opcode =3D FUSE_LOOKUP;
> > +       args->nodeid =3D nodeid;
> > +       args->in_numargs =3D 3;
> > +       fuse_set_zero_arg0(args);
> > +       args->in_args[1].size =3D name->len;
> > +       args->in_args[1].value =3D name->name;
> > +       args->in_args[2].size =3D 1;
> > +       args->in_args[2].value =3D "";
>
> I know you just carried this, but do you know what this is?
> some sort of backward compat inarg?

I believe this is for the null terminator (to properly null-terminate
the name string that gets sent to the server)

>
> > +       args->out_numargs =3D 1;
> > +
> > +       if (use_entry2) {
> > +               args->out_args[0].size =3D sizeof(struct fuse_entry2_ou=
t);
> > +               args->out_args[0].value =3D outarg2;
> > +       } else {
> > +               args->out_args[0].size =3D sizeof(struct fuse_entry_out=
);
> > +               args->out_args[0].value =3D outarg;
> > +       }
> > +}
> > +
> > +static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr=
 *attr)
> > +{
> > +       memset(attr, 0, sizeof(*attr));
> > +       attr->ino =3D sx->ino;
> > +       attr->size =3D sx->size;
> > +       attr->blocks =3D sx->blocks;
> > +       attr->atime =3D sx->atime.tv_sec;
> > +       attr->mtime =3D sx->mtime.tv_sec;
> > +       attr->ctime =3D sx->ctime.tv_sec;
> > +       attr->atimensec =3D sx->atime.tv_nsec;
> > +       attr->mtimensec =3D sx->mtime.tv_nsec;
> > +       attr->ctimensec =3D sx->ctime.tv_nsec;
> > +       attr->mode =3D sx->mode;
> > +       attr->nlink =3D sx->nlink;
> > +       attr->uid =3D sx->uid;
> > +       attr->gid =3D sx->gid;
> > +       attr->rdev =3D new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_mi=
nor));
> > +       attr->blksize =3D sx->blksize;
> > +}
> > +
> > +static void fuse_entry2_to_entry(struct fuse_entry2_out *outarg2,
> > +                                struct fuse_entry_out *outarg)
> > +{
> > +       memset(outarg, 0, sizeof(struct fuse_entry_out));
> > +       outarg->nodeid =3D outarg2->nodeid;
> > +       outarg->generation =3D outarg2->generation;
> > +       outarg->entry_valid =3D outarg2->entry_valid;
> > +       outarg->attr_valid =3D outarg2->attr_valid;
> > +       outarg->entry_valid_nsec =3D outarg2->entry_valid_nsec;
> > +       outarg->attr_valid_nsec =3D outarg2->attr_valid_nsec;
> > +       fuse_statx_to_attr(&outarg2->statx, &outarg->attr);
> > +}
> > +
> > +static __maybe_unused int fuse_process_entry2(struct fuse_conn *fc,
> > +                                             struct fuse_entry2_out *o=
utarg2,
> > +                                             struct fuse_entry_out *ou=
targ,
> > +                                             struct fuse_statx **sxp)
> > +{
> > +       if (!fuse_use_entry2(fc))
> > +               return 0;
> > +
> > +       fuse_entry2_to_entry(outarg2, outarg);
> > +
> > +       /* error */
> > +       if (outarg2->backing_id < 0)
> > +               return outarg2->backing_id;
> > +
> > +       /*
> > +        * If passthrough is enabled (backing_id > 0), statx attributes=
 are not
> > +        * cached because passthrough getattr fetches them directly fro=
m the
> > +        * backing inode
> > +        */
> > +       if (!outarg2->backing_id)
> > +               *sxp =3D &outarg2->statx;
> > +       return outarg2->backing_id;
> > +}
> > +
>
> Need to check that outargs2->flags and ->reserved are 0.

Good idea, I'll add checking for this in v2.

Thanks,
Joanne
>
> Thanks,
> Amir.
